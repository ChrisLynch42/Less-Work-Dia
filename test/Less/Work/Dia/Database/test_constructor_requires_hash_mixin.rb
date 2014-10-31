require 'minitest/autorun'

module Less
  module Work
    module Dia
      module Database
        module TestConstructorRequiresHashMixin

          def test_constructor_no_parameter
            assert_raises ArgumentError do
              diagram_file = @test_class_constant.new()
            end
          end


          def test_constructor_nil_parameter
            assert_raises ArgumentError do
              diagram_file =  @test_class_constant.new(nil)
            end
          end

          def test_constructor_valid_parameter
            assert_silent { @test_class_constant.new(return_valid_hash_parameter) }
          end


        end
      end
    end
  end
end
