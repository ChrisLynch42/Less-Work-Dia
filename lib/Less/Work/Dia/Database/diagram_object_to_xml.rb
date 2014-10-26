require 'nokogiri'
require_relative 'xml_fragment_mixin'

module Less
  module Work
    module Dia
      module Database
        class DiagramObjectToXML
          include XMLFragmentMixin

          def get_column_fragment
            namespaced_fragement column_xml
          end

        end
      end
    end
  end
end
