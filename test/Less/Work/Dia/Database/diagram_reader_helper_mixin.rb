require 'minitest/autorun'
require_relative '../../../../test_helper'
require_relative '../diagram_file_helper_mixin'

module Less
  module Work
    module Dia
      module Database
        module DiagramReaderHelperMixin
          include DiagramFileHelperMixin

          def return_valid_diagram_parser_object
            DiagramReader.new(return_valid_hash_parameter)
          end

          def return_valid_parser_hash_parameter
            {:diagram_xml => return_valid_diagram_file_object().diagram_xml}
          end
        end
      end
    end
  end
end
