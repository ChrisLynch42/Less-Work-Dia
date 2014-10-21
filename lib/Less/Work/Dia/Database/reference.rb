require_relative 'reference_connection_point'

module Less
  module Work
    module Dia
      module Database
        class Reference
          attr_accessor :diagram_id
          attr_reader :start_point, :end_point

          def initialize
            self.start_point=ReferenceConnectionPoint.new()
            self.end_point=ReferenceConnectionPoint.new()
          end

          private
          attr_writer :start_point, :end_point
        end
      end
    end
  end
end
