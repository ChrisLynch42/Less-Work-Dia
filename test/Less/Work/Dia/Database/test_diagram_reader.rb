require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_reader'
require_relative '../../../../../lib/Less/Work/Dia/diagram_file'
require_relative 'diagram_reader_helper_mixin'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDiagramReader < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin
          include DiagramReaderHelperMixin

          def setup
            @test_object = return_valid_diagram_reader_object
            @test_class_constant = DiagramReader
          end


          def test_diagram_parser_diagram_object
            diagram_parser = return_valid_diagram_reader_object
            assert_equal(27, diagram_parser.database_diagram_members.tables.length,"Diagram object table count was not 27.")
            assert_equal(28, diagram_parser.database_diagram_members.references.length,"Diagram object reference count was not 28.")


            check_reference(diagram_parser,'O2')
            check_reference(diagram_parser,'O54')

            refute_nil(diagram_parser.database_diagram_members.tables['spells'],"Diagram object Spells table was missing.")

            ###check tables by name
            assert_equal('spells', diagram_parser.database_diagram_members.tables['spells'].name, "Diagram object spells table's name was not 'spells'.")
            assert_equal(11, diagram_parser.database_diagram_members.tables['spells'].get_column_names().length, "Diagram object spells table column count was not 11.")
            refute_nil(diagram_parser.database_diagram_members.tables['spells'].diagram_id, "Diagram object spells table has a nil diagram_id.")
            refute_nil(diagram_parser.database_diagram_members.tables['spells'].get_column('id'),"Diagram object Spells table id column was missing.")
            assert_equal('id', diagram_parser.database_diagram_members.tables['spells'].get_column('id').name, "Diagram object spells table's id column's name was not 'id'.")
            assert_equal(true, diagram_parser.database_diagram_members.tables['spells'].get_column('id').primary_key, "Diagram object spells table's id column's was not a primary key.")

            ##check column names order
            column_names = diagram_parser.database_diagram_members.tables['spells'].get_column_names()
            assert_equal('id', column_names[0], "Diagram object spells table's 0 column names was not 'id'.")
            assert_equal('title', column_names[1], "Diagram object spells table's 1 column names was not 'id'.")
            assert_equal('ritual', column_names[10], "Diagram object spells table's 1 column names was not 'id'.")


            assert_equal('spells', diagram_parser.database_diagram_members.tables_by_id['O28'], "Diagram object table_by_id value was not 'spells'.")


          end

          def check_reference(diagram_parser, reference_id)
            refute_nil(diagram_parser.database_diagram_members.references[reference_id],"Diagram object #{reference_id} reference was nil.")
            refute_nil(diagram_parser.database_diagram_members.references[reference_id].start_point,"Diagram object #{reference_id} reference start point was nil.")
            refute_nil(diagram_parser.database_diagram_members.references[reference_id].start_point.target_object_id,"Diagram object #{reference_id} reference target object id was nil.")
          end

          private




          def return_valid_hash_parameter
            return_valid_diagram_file_hash_parameter
          end


        end
      end
    end
  end
end
