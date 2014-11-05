require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_object'
require_relative '../../../../test_helper'


module Less
  module Work
    module Dia
      module Database
        class TestDiagramObject < Minitest::Test

          def setup
            @test_object = DiagramObject.new()
            @test_class_constant = DiagramObject
          end


          def test_diagram_parser_diagram_object
            assert_equal('O1',@test_object.new_object_id,"New object id was not O1")
          end

          private

        end
      end
    end
  end
end
