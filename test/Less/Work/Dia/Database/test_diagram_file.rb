require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/diagram_file'
require_relative '../../../../test_helper'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'

module Less
  module Work
    module Dia
      module Database
        class TestDiagramFile < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin

          def setup
            @test_object = return_valid_diagram_file_object
            @test_class_constant = DiagramFile
          end


          def test_read_file_returns_content
            diagram_file = return_valid_diagram_file_object
            refute_nil diagram_file.diagram_xml, "Read file return nil!"
          end

          private
          def return_valid_diagram_file_object
            DiagramFile.new(return_valid_hash_parameter)
          end

          def return_valid_hash_parameter
            {:file_path => TestFiles::TEST }
          end


        end
      end
    end
  end
end
