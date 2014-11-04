require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/xml_fragment'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_fragments'
require_relative 'test_parameter_mixin_mixin'
require_relative 'test_constructor_requires_hash_mixin'

module Less
  module Work
    module Dia
      module Database
        class TestXMLFragment < Minitest::Test
          include TestParameterMixinMixin
          include TestConstructorRequiresHashMixin

          # Called before every test method runs. Can be used
          # to set up fixture information.
          def setup
            @test_object = return_valid_xml_fragment_object
            @test_class_constant = XMLFragment

          end

          # Called after every test method runs. Can be used to tear
          # down fixture information.

          def teardown
            # Do nothing
          end

          def test_has_valid_xml
            column_xml_fragment = return_valid_xml_fragment_object
            refute_nil(column_xml_fragment.xml,"Column xml fragement did not have xml nodeset")
            assert(column_xml_fragment.xml.to_xml.length > 20,"Column xml fragement to_xml did not return a long enough response.")
            root_nodeset = column_xml_fragment.xml.xpath('dia:composite')
            refute_nil(root_nodeset,"Nodeset returned from //dia:composite was nil")
            refute_nil(root_nodeset.first,"Nodeset did not have a first record.")
            assert_equal('table_attribute',root_nodeset.first['type'],"The first record of the nodeset did not have a type of table_attribute")
            assert_equal(6,column_xml_fragment.xml.xpath('.//dia:attribute').length,".//dia:attribute did not return the correct number of records.")
          end

          # def test_has_column_attributes
          #   column_xml_fragment = return_valid_xml_fragment_object
          #   assert_equal('table_attribute',column_xml_fragment.xml.first['type'],"Did not match")
          #
          # end



          private
          def return_valid_hash_parameter
            diagram_fragments = DiagramFragments.new()
            {:diagram_fragment => diagram_fragments.column}
          end

          def return_valid_xml_fragment_object
            XMLFragment.new(return_valid_hash_parameter)
          end
        end
      end
    end
  end
end