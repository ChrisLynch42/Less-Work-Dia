require_relative '../../../../../lib/Less/Work/Dia/Database/dia_database_file'
require_relative '../../../../test_helper'

module Less
  module Work
    module Dia
      module Database
        module TestDiaDatabaseFileMixin
          def test_read_file_method_exist
            assert_respond_to(@object, :read_file)
          end

          def test_read_file_nil
            assert_raises ArgumentError do
              @object.read_file(nil)
            end
          end

          def test_read_file_empty
            assert_raises ArgumentError do
              @object.read_file()
            end
          end

          def test_read_file
            puts 'test_read_file'
            assert_silent { @object.read_file({:file_path => TestFiles::TEST }) }
          end

          def test_read_file_returns_content
            refute_nil @object.read_file({:file_path => TestFiles::TEST }), "Read file return nil!"
          end

        end
      end
    end
  end
end
