require 'minitest/autorun'
require_relative 'test_diagram_file_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDiaDatabaseFile < Minitest::Test
          include Less::Work::Dia::Database::TestDiagramFileMixin

          def setup
            @object = DiagramFile.new()
          end
        end
      end
    end
  end
end
