require_relative '../../../../../lib/Less/Work/Dia/Database/dia_database_file'

module Less
  module Work
    module Dia
      module Database
        module TestDiaDatabaseFileMixin
          def test_read_file_exist
            assert_respond_to(@object, :read_file)
          end

          def test_read_file
            assert_raises ArgumentError do
              @object.read_file(nil)
            end
          end
        end
      end
    end
  end
end
