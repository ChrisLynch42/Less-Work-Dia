require_relative '../../parameter_mixin'

module Less
  module Work
    module Dia
      module Database
        class Table
          include ParameterMixin
          attr_accessor :name, :type, :diagram_id

          def initialize
            @columns = Hash.new()
            @columns_in_order = []
            @references = Hash.new()
          end

          def add_column(parameters)
            parameters_pair_check parameters, :column
            column = parameters[:column]
            @columns[column.name] = column
            @columns_in_order[@columns_in_order.length] = column.name
          end

          def get_column(column_name)
            @columns[column_name]
          end


          def get_column_names
            @columns_in_order
          end


          private
          @columns
          @columns_in_order
          @references
        end
      end
    end
  end
end
