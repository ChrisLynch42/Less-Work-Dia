require 'nokogiri'
require_relative '../base_mixin'


module Less
  module Work
    module Dia
      class DiagramFile
        include BaseMixin

        def read_file(parameters = {})
          parameters_pair_nil?(parameters,:file_path)
          parse_file_content(open_file(parameters[:file_path]))
        end


        private
        def open_file(file_path)
          if File.exist?(file_path)
            f = File.open(file_path)
          end
        end

        def parse_file_content(file)
          if !file.nil?
            dia_xml = Nokogiri::XML(file)
          end
        end
      end
    end
  end
end
