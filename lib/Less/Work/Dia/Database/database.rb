module Less
  module Work
    module Dia
      module Database
        class Database
          attr_reader :tables, :relationships

          def initialize
            self.tables = Hash.new()
            self.relationships = Hash.new()
          end

          private
          attr_writer :tables, :relationships
        end
      end
    end
  end
end
