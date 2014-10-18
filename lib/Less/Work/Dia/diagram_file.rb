require 'nokogiri'
require_relative '../parameter_mixin'


module Less
  module Work
    module Dia
      class DiagramFile
        include ParameterMixin
        attr_reader :diagram_xml

        def initialize(parameters)
          read_file_in(parameters)
        end

        private
        attr_writer :diagram_xml

        def read_file_in(parameters)
          parameters_pair_check(parameters,:file_path)
          parse_file_content(open_file(parameters[:file_path]))
        end

        def open_file(file_path)
          if File.exist?(file_path)
            f = File.open(file_path)
          end
        end

        def parse_file_content(file)
          if !file.nil?
            self.diagram_xml = Nokogiri::XML(file)
          end
        end
      end
    end
  end
end
