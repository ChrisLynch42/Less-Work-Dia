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


          def convert() {


          }
          end
        end
      end
    end
  end
end
