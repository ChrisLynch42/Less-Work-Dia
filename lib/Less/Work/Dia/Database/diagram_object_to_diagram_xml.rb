require 'nokogiri'
require_relative 'diagram_fragments'

module Less
  module Work
    module Dia
      module Database
        class DiagramObjectToDiagramXML
          include DiagramFragments

          def get_column_fragment
            namespaced_fragement column_xml
          end

        end
      end
    end
  end
end
