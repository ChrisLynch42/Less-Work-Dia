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
