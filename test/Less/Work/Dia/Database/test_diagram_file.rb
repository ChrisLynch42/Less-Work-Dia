require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/diagram_file'
require_relative '../../../../test_helper'



module Less
  module Work
    module Dia
      module Database
        class TestDiagramFile < Minitest::Test


          def test_no_parameter
            assert_raises ArgumentError do
              diagram_file = DiagramFile.new()
            end
          end


          def test_nil_parameter
            assert_raises ArgumentError do
              diagram_file = DiagramFile.new(nil)
            end
          end

          def test_valid_parameter
            assert_silent { diagram_file = return_valid_diagram_file_object }
          end

          def test_read_file_returns_content
            diagram_file = return_valid_diagram_file_object
            refute_nil diagram_file.diagram_xml, "Read file return nil!"
          end

          private
          def return_valid_diagram_file_object
            DiagramFile.new({:file_path => TestFiles::TEST })
          end

        end
      end
    end
  end
end
