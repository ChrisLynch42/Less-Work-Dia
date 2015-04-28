require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/reference_connection_point'


module Less
  module Work
    module Dia
      module Database
        class TestReferenceConnectionPoint < Minitest::Test

          def setup
            @test_object = return_valid_reference_connection_point
            @test_class_constant = ReferenceConnectionPoint
          end


          def test_order_hash
            assert_equal(0, @test_object.connection_to_column_order('12'),"Did not match 0")
          end


          private

          def return_valid_reference_connection_point
            return ReferenceConnectionPoint.new()
          end




        end
      end
    end
  end
end
