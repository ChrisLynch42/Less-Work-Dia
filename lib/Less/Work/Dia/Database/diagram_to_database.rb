require_relative 'diagram_reader'

module Less
  module Work
    module Dia
      module Database
        class DiagramToDatabase

          attr_reader :database, :diagram_reader
          def initialize(parameters = {})
            this.diagram_reader = DiagramReader.new(parameters)
            this.database = Database.new()
          end





          private
          attr_writer :database, :diagram_reader


          def convert()
            this.diagram_reader.database_diagram_members.tables.each do | table_name, table_member |
              table = Table.new()
              table.columns_in_order.each do | column |
                table
              end
              this.database.tables[table_name] =

            end

          end
        end
      end
    end
  end
end
