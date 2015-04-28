require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_reader'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_to_database'
require_relative '../../../../../lib/Less/Work/Dia/diagram_file'
require_relative 'diagram_reader_helper_mixin'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDiagramToDatabase < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin
          include DiagramReaderHelperMixin

          def setup
            @test_object = return_valid_diagram_reader_object
            @test_class_constant = DiagramToDatabase
          end


          def test_database_object
            diagram_to_database = return_valid_diagram_to_database_object
            database = diagram_to_database.database
            assert_equal(27, database.tables.length,"Diagram object table count was not 27.")


            assert_equal(28, database.relationships.length,"Diagram object reference count was not 28.")
            refute_nil(database.relationships[0],"Diagram first relationship is missing.")
            assert_equal('column_set', database.relationships[0].parent_table,"Diagram first relationship parent table does not match.")
            assert_equal('column_id', database.relationships[0].referenced_key_column,"Diagram first relationship parent reference key column does not match.")



            refute_nil(database.tables['spells'],"Diagram object Spells table was missing.")
            assert_equal('spells', database.tables['spells'].name, "Diagram object spells table's name was not 'spells'.")
            assert_equal(11, database.tables['spells'].get_column_names().length, "Diagram object spells table column count was not 11.")
            refute_nil(database.tables['spells'].diagram_id, "Diagram object spells table has a nil diagram_id.")
            refute_nil(database.tables['spells'].get_column('id'),"Diagram object Spells table id column was missing.")
            assert_equal('id', database.tables['spells'].get_column('id').name, "Diagram object spells table's id column's name was not 'id'.")
            assert_equal(true, database.tables['spells'].get_column('id').primary_key, "Diagram object spells table's id column's was not a primary key.")

          end

          private

          def return_valid_diagram_to_database_object
            return DiagramToDatabase.new(return_valid_diagram_file_hash_parameter)
          end


          def return_valid_hash_parameter
            return_valid_diagram_file_hash_parameter
          end


        end
      end
    end
  end
end
