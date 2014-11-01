require 'nokogiri'
require_relative '../../parameter_mixin'

module Less
  module Work
    module Dia
      module Database
        class XMLFragment
          include ParameterMixin
          attr_reader :diagram_fragment
          attr_reader :xml

          def initialize(parameters = {})
            parameters_pair_check(parameters,:diagram_fragment);
            self.diagram_fragment = parameters[:diagram_fragment]
            self.xml=namespaced_fragment(self.diagram_fragment)
          end


          private
          attr_writer :diagram_fragment
          attr_writer :xml

          def namespaced_fragment(diagram_fragment)
            xml_doc = Nokogiri::XML(%Q(<root xmlns:dia='http://www.lysator.liu.se/~alla/dia/'/>))
            xml_doc.fragment(diagram_fragment)
          end


        end
      end
    end
  end
end