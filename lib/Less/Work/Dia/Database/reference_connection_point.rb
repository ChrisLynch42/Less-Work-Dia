require_relative '../connection_point'

module Less
  module Work
    module Dia
      module Database
        class ReferenceConnectionPoint < ConnectionPoint

          def initialize()
            @translate_hash = Hash.new()
            (12..200).each { |val|
              evenVal = val - (val % 2)
              row = (evenVal - 10)
              row = (row / 2) - 1
              @translate_hash[val]=row;
              @translate_hash[val.to_s]=row;

            }
          end

          def column_order
            connection_to_column_order(@connection)
          end

          def connection_to_column_order(connection_point)
            @translate_hash[connection_point]
          end
        end
      end
    end
  end
end