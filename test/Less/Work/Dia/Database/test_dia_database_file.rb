require 'minitest/autorun'
require_relative 'test_dia_database_file_mixin'


module Less
  module Work
    module Dia
      module Database
        class TestDiaDatabaseFile < Minitest::Test
          include Less::Work::Dia::Database::TestDiaDatabaseFileMixin

          def setup
            @object = DiaDatabaseFile.new()
          end
        end
      end
    end
  end
end
