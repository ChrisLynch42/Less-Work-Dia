require_relative '../../parameter_mixin'
require_relative '../object_parser_mixin'

module Less
  module Work
    module Dia
      class DiagramParser
        include ParameterMixin
        include ObjectParserMixin

        attr_reader :tables_by_name, :tables_by_id, :references


        def initialize(parameters = {})
          self.tables_by_name=Hash.new()
          self.tables_by_id=Hash.new()
          self.references=Hash.new()

          parse(parameters);
        end

        private
        attr_writer :tables_by_name, :tables_by_id, :references

        def parse(parameters)
          parameters_pair_check parameters, :diagram_xml
          parse_tables(parameters[:diagram_xml])
          parse_references(parameters[:diagram_xml])
        end

        def parse_references(diagram_xml)
          reference_nodes =self.dia_xml.xpath("//dia:object[@type='Database - Reference']")
          if !reference_nodes.nil?

            reference_nodes.each do |reference_node|
              reference_parser = @parser_class_factory.parser(REFERENCE)
              reference_parser_object=reference_parser.new()
              reference_parser_object.parse(reference_node)
              if !reference_parser_object.nil?
                @references[reference_parser_object.id] = reference_parser_object
              end
            end
          end

        end

        def parse_tables(diagram_xml)
          table_nodes =self.dia_xml.xpath("//dia:object[@type='Database - Table']")
          if !table_nodes.nil?
            table_nodes.each do |table_node|
              table_parser = @parser_class_factory.parser(TABLE)
              table_parser_object=table_parser.new()
              table_parser_object.parse(table_node)
              if !table_parser_object.nil?
                self.tables_by_name[table_parser_object.name] = table_parser_object
                self.tables_by_id[table_parser_object.object_id] = table_parser_object
              end
            end
          end

        end

      end
    end
  end
end
