module Less
  module Work
    module Dia
      module Database
        class DatabaseDiagramMembers
          attr_reader :tables, :references, :tables_by_id, :current_object_id

          def initialize
            self.tables = Hash.new()
            self.references = Hash.new()
            self.tables_by_id = Hash.new()
            self.current_object_id ='O0'
          end

          def new_object_id()
            current_number_string = self.current_object_id()[1,self.current_object_id().length]
            new_number = current_number_string.to_i
            new_number = new_number + 1
            self.current_object_id = self.current_object_id()[0] + new_number.to_s
          end

          def update_object_id(local_object_id)
            if self.current_object_id.length < local_object_id.length || local_object_id > self.current_object_id
              self.current_object_id =  local_object_id
            end
          end


          private
          attr_writer :tables, :references, :tables_by_id, :current_object_id
        end
      end
    end
  end
end
