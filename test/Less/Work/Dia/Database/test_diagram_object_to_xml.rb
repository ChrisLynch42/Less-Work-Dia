require 'minitest/autorun'
require_relative '../../../../../lib/Less/Work/Dia/Database/diagram_object_to_xml'

module Less
  module Work
    module Dia
      module Database
        class TestDiagramObjectToXML < Minitest::Test

          # Called before every test method runs. Can be used
          # to set up fixture information.
          def setup
            # Do nothing
          end

          # Called after every test method runs. Can be used to tear
          # down fixture information.

          def teardown
            # Do nothing
          end

          # Fake test
          def test_get_column_fragment
            diagram_object_to_xml = DiagramObjectToXML.new()
            xml_fragment = diagram_object_to_xml.get_column_fragment
            assert_respond_to(xml_fragment, :to_xml, 'Column fragment is not a nokogiri document fragment')
            xml_fragment.root.add_namespace_definition("dia", "http://www.lysator.liu.se/~alla/dia/")
            puts xml_fragment.collect_namespaces().to_s
            puts 'xxx'
            #xml_fragment.remove_namespaces!
            #puts xml_fragment.to_xml
            #some_nodes = xml_fragment.xpath("//dia:attribute", 'dia' => 'http://www.lysator.liu.se/~alla/dia/')
            some_nodes = xml_fragment.root.xpath("//dia:attribute")
            puts xml_fragment.root['type']
            puts some_nodes.to_s
            puts 'yyy'
            #assert_equal('table_xattribute', xml_fragment['type'],"Column fragment does not have a type of table_attribute")
          end
        end
      end
    end
  end
end