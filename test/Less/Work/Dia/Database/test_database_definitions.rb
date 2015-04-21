require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/database_diagram_members'
require_relative 'diagram_reader_helper_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDatabaseDiagramMembers < Minitest::Test

          def setup
            @test_object = DatabaseDiagramMembers.new()
            @test_class_constant = DatabaseDiagramMembers
          end


          def test_diagram_object_new_object_id
            assert_equal('O1',@test_object.new_object_id,"New object id was not O1")
          end

          private
          def return_valid_hash_parameter

          end
        end
      end
    end
  end
end
