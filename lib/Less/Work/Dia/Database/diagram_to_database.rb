require_relative 'diagram_reader'
require_relative 'relationship'

module Less
  module Work
    module Dia
      module Database
        class DiagramToDatabase

          attr_reader :database, :diagram_reader
          def initialize(parameters = {})
            self.diagram_reader = DiagramReader.new(parameters)
            self.database = Database.new()
            convert()
          end





          private
          attr_writer :database, :diagram_reader


          def convert()
            self.diagram_reader.database_diagram_members.tables.each do | table_name, table_member |
              self.database.tables[table_name] = table_member
            end

            self.diagram_reader.database_diagram_members.references.each do | reference_id, reference |
              relationship = Relationship.new()
              table_parent = self.diagram_reader.database_diagram_members.tables[reference.start_point.target_object_id]
              #relationship.parent_table = table_parent.name

              table_child = self.diagram_reader.database_diagram_members.tables[reference.end_point.target_object_id]
              #relationship.child_table = table_child.name



              database.relationships[database.relationships.length] = relationship
            end
          end
        end
      end
    end
  end
end
