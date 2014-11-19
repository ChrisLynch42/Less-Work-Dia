require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_object'
require_relative 'diagram_parser_helper_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDiagramObject < Minitest::Test

          def setup
            @test_object = DiagramObject.new()
            @test_class_constant = DiagramObject
          end


          def test_diagram_object_new_object_id
            assert_equal('O1',@test_object.new_object_id,"New object id was not O1")
          end

          def test_diagram_object_to_diagram_xml
            @test_object.to_diagram_xml

          end


          private
          def return_valid_hash_parameter

          end
        end
      end
    end
  end
end
