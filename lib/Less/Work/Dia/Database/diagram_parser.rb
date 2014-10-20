require_relative '../../parameter_mixin'
require_relative '../object_parser_mixin'
require_relative 'table'
require_relative 'reference'
require_relative 'column'
require_relative 'diagram_object'


module Less
  module Work
    module Dia
      class DiagramParser
        include ParameterMixin
        include ObjectParserMixin

        attr_reader :diagram_object


        def initialize(parameters = {})
          self.diagram_object=DiagramObject.new()
          parse(parameters);
        end

        private
        attr_writer :diagram_object

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
              diagram_object.references[reference.diagram_id] = reference
            end
          end

        end

        def parse_tables(diagram_xml)
          table_nodes = diagram_xml.xpath("//dia:object[@type='Database - Table']")
          if !table_nodes.nil?
            table_nodes.each do |table_node|
              table = Table.new()
              table.name=get_dia_string(table_node,'name')
              parse_table_columns(table_node,table)
              diagram_object.tables[table.name] = table
              diagram_object.tables_by_id[table.diagram_id] = table
            end
          end
        end

        def parse_table_columns(table_node,table)
          column_nodes = table_node.xpath("./dia:attribute[@name='attributes']/dia:composite[@type='table_attribute']")
          if !column_nodes.nil?
            column_nodes.each do |column_node|
              column = Column.new()
              column.name=get_dia_string(column_node,'name')
              column.data_type = get_dia_string(column_node,'type')
              column.comment = get_dia_string(column_node,'comment')
              column.primary_key = get_dia_boolean(column_node,'primary_key')
              column.nullable = get_dia_boolean(column_node,'nullable')
              column.unique = get_dia_boolean(column_node,'unique')

              table.columns[column.name] = column
              table.columns_in_order[table.columns_in_order.length] = column
            end
          end
        end


      end
    end
  end
end
