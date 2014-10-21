module Less
  module Work
    module Dia
      module Database
        class Table
          attr_accessor :name, :type, :diagram_id
          attr_reader :columns, :columns_in_order, :references

          def initialize
            self.columns = Hash.new()
            self.columns_in_order = Hash.new()
            self.references = Hash.new()
          end

          private
          attr_writer :columns, :columns_in_order, :references
        end
      end
    end
  end
end
