require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/parameter_mixin'

module Less
  module Work
    module Dia
      module Database
        module TestParameterMixinMixin
          include ParameterMixin

          def test_no_hash_parameter
            assert_raises ArgumentError do
              @test_object.parameters_hash_check
            end
          end

          def test_nil_hash_parameter_pair
            assert_raises ArgumentError do
              @test_object.parameters_pair_check(nil,:file_path)
            end
          end

          
          def test_valid_hash_parameter
            assert_silent { diagram_file = @test_object.parameters_hash_check(return_valid_hash_parameter) }
          end

        end
      end
    end
  end
end
