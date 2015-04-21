require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/database'
require_relative 'diagram_reader_helper_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDatabase < Minitest::Test

          def setup
            @test_object = Database.new()
            @test_class_constant = Database
          end

          def test_tables_is_a_hash
            assert(@test_object.tables().instance_of?(Hash),"Tables attribute is not a Hash.")
          end

          def test_relationships_is_a_hash
            assert(@test_object.tables().instance_of?(Hash),"Relationships attribute is not a Hash.")
          end

          private
          def return_valid_hash_parameter

          end
        end
      end
    end
  end
end
