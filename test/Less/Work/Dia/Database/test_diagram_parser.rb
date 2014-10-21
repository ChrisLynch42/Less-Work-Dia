require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_parser'
require_relative '../../../../test_helper'



module Less
  module Work
    module Dia
      module Database
        class TestDiagramParser < Minitest::Test


          def test_diagram_parser_no_parameter
            assert_raises ArgumentError do
              diagram_file = DiagramParser.new()
            end
          end


          def test_diagram_parser_nil_parameter
            assert_raises ArgumentError do
              diagram_file = DiagramParser.new(nil)
            end
          end

          def test_diagram_parser_valid_parameter
            assert_silent { diagram_parser = return_valid_diagram_parser_object }
          end

          def test_diagram_parser_diagram_object
            diagram_parser = return_valid_diagram_parser_object
            assert_equal(27, diagram_parser.diagram_object.tables.length,"Diagram object table count was not 27.")
            assert_equal(28, diagram_parser.diagram_object.references.length,"Diagram object reference count was not 28.")
            refute_nil(diagram_parser.diagram_object.tables['spells'],"Diagram object Spells table was missing.")
            assert_equal('spells', diagram_parser.diagram_object.tables['spells'].name, "Diagram object spells table's name was not 'spells'.")
            assert_equal(11, diagram_parser.diagram_object.tables['spells'].columns.length, "Diagram object spells table column count was not 11.")
            refute_nil(diagram_parser.diagram_object.tables['spells'].columns['id'],"Diagram object Spells table id column was missing.")
            assert_equal('id', diagram_parser.diagram_object.tables['spells'].columns['id'].name, "Diagram object spells table's id column's name was not 'id'.")
            assert_equal(true, diagram_parser.diagram_object.tables['spells'].columns['id'].primary_key, "Diagram object spells table's id column's was not a primary key.")

          end


          private
          def return_valid_diagram_file_object
            DiagramFile.new({:file_path => TestFiles::TEST })
          end

          def return_valid_diagram_parser_object
            DiagramParser.new({:diagram_xml => return_valid_diagram_file_object().diagram_xml})
          end

        end
      end
    end
  end
end
