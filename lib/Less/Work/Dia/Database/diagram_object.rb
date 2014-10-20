module Less
  module Work
    module Dia
      class DiagramObject
        attr_reader :tables, :references, :tables_by_id

        def initialize
          self.tables = Hash.new()
          self.references = Hash.new()
          self.tables_by_id = Hash.new()
        end

        private
        attr_writer :tables, :references, :tables_by_id

      end
    end
  end
end
