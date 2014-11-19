require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/diagram_file'
require_relative '../diagram_file_helper_mixin'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'

module Less
  module Work
    module Dia
      module Database
        class TestDiagramFile < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin
          include DiagramFileHelperMixin

          def setup
            @test_object = return_valid_diagram_file_object
            @test_class_constant = DiagramFile
          end


          def test_read_file_returns_content
            diagram_file = return_valid_diagram_file_object
            refute_nil diagram_file.diagram_xml, "Read file return nil!"
          end

          def return_valid_hash_parameter
            return_valid_file_hash_parameter
          end

        end
      end
    end
  end
end
