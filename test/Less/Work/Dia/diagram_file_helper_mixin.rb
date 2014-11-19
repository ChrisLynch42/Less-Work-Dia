require 'minitest/autorun'
require_relative '../../../test_helper'

module Less
  module Work
    module Dia
      module DiagramFileHelperMixin

        def return_valid_diagram_file_object
          DiagramFile.new(return_valid_file_hash_parameter)
        end

        def return_valid_file_hash_parameter
          {:file_path => TestFiles::TEST }
        end

      end
    end
  end
end
