require_relative '../../parameter_mixin'
require_relative '../object_parser_mixin'
require_relative 'table'
require_relative 'reference'
require_relative 'column'
require_relative 'database_diagram_members'


module Less
  module Work
    module Dia
      module Database
        class DiagramReader
          include ParameterMixin
          include ObjectParserMixin

          attr_reader :database_diagram_members, :current_object_id


          def initialize(parameters = {})
            self.database_diagram_members=DatabaseDiagramMembers.new()
            parse(parameters);
          end


          private
          attr_writer :database_diagram_members

          def parse(parameters)
            parameters_pair_check parameters, :diagram_xml
            parse_tables(parameters[:diagram_xml])
            parse_references(parameters[:diagram_xml])
          end

          def parse_references(diagram_xml)
            reference_nodes = diagram_xml.xpath("//dia:object[@type='Database - Reference']")
            if !reference_nodes.nil?

              reference_nodes.each do |reference_node|
                reference = Reference.new()
                reference.diagram_id = reference_node['id'].to_s
                parse_reference_endpoints(reference_node, reference)
                self.database_diagram_members.update_object_id(reference.diagram_id)
                self.database_diagram_members.references[reference.diagram_id] = reference
              end
            end
          end

          def parse_reference_endpoints(reference_node, reference)
            connection_xpath = "./dia:connections/dia:connection"
            connection_nodes = reference_node.xpath(connection_xpath)
            if !connection_nodes.nil?
              connection_nodes.each { |side|
                if !side.nil?
                  if side['handle'] == '0'
                    set_reference_point_values(reference.start_point, side)
                  else
                    set_reference_point_values(reference.end_point, side)
                  end
                end
              }
            end
          end

          def set_reference_point_values(reference, side)
            reference.handle=side['handle']
            reference.target_object_id=side['to']
            reference.connection=side['connection']
          end



          def parse_tables(diagram_xml)
            table_nodes = diagram_xml.xpath("//dia:object[@type='Database - Table']")
            if !table_nodes.nil?
              table_nodes.each do |table_node|
                table = Table.new()
                table.name=get_dia_string(table_node, 'name')
                table.diagram_id = table_node['id'].to_s
                self.database_diagram_members.update_object_id(table.diagram_id)
                parse_table_columns(table_node, table)
                self.database_diagram_members.tables[table.name] = table
                self.database_diagram_members.tables_by_id[table.diagram_id] = table.name
              end
            end
          end

          def parse_table_columns(table_node, table)
            column_nodes = table_node.xpath("./dia:attribute[@name='attributes']/dia:composite[@type='table_attribute']")
            if !column_nodes.nil?
              column_nodes.each do |column_node|
                column = Column.new()
                column.name=get_dia_string(column_node, 'name')
                column.data_type = get_dia_string(column_node, 'type')
                column.comment = get_dia_string(column_node, 'comment')
                column.primary_key = get_dia_boolean(column_node, 'primary_key')
                column.nullable = get_dia_boolean(column_node, 'nullable')
                column.unique = get_dia_boolean(column_node, 'unique')

                table.add_column({:column => column})
              end
            end
          end
        end

      end
    end
  end
end
