require 'nokogiri'
require_relative 'diagram_xml_mixin'

module Less
  module Work
    module Dia
      module Database
        class DiagramObjectToXML
          include DiagramXMLMixin

          def get_column_fragment
            table_fragment = Nokogiri::XML(column_xml)
          end

        end
      end
    end
  end
end
