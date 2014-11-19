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
            @test_object = return_valid_diagram_parser_object
            @test_class_constant = DiagramReader
          end


          def test_diagram_parser_diagram_object
            diagram_parser = return_valid_diagram_parser_object
            assert_equal(27, diagram_parser.diagram_object.tables.length,"Diagram object table count was not 27.")
            assert_equal(28, diagram_parser.diagram_object.references.length,"Diagram object reference count was not 28.")
            refute_nil(diagram_parser.diagram_object.tables['spells'],"Diagram object Spells table was missing.")
            assert_equal('spells', diagram_parser.diagram_object.tables['spells'].name, "Diagram object spells table's name was not 'spells'.")
            assert_equal(11, diagram_parser.diagram_object.tables['spells'].columns.length, "Diagram object spells table column count was not 11.")
            refute_nil(diagram_parser.diagram_object.tables['spells'].diagram_id, "Diagram object spells table has a nil diagram_id.")
            refute_nil(diagram_parser.diagram_object.tables['spells'].columns['id'],"Diagram object Spells table id column was missing.")
            assert_equal('id', diagram_parser.diagram_object.tables['spells'].columns['id'].name, "Diagram object spells table's id column's name was not 'id'.")
            assert_equal(true, diagram_parser.diagram_object.tables['spells'].columns['id'].primary_key, "Diagram object spells table's id column's was not a primary key.")

          end

          private

          def return_valid_hash_parameter
            return_valid_parser_hash_parameter
          end


        end
      end
    end
  end
end
