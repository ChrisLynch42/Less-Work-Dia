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
            composite_nodes = xml_fragment.xpath("dia:composite")
            assert(composite_nodes.length > 0, 'XPath query for dia:composite failed!')
            assert_equal('table_attribute', composite_nodes.first['type'],"Composite node does not have a type of table_attribute")
          end
        end
      end
    end
  end
end