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
              parent_name = self.diagram_reader.database_diagram_members.tables_by_id[reference.start_point.target_object_id]
              table_parent = self.diagram_reader.database_diagram_members.tables[parent_name]
              relationship.parent_table = table_parent.name

              reference_column = table_parent.get_column_names()[reference.start_point.column_order]
              relationship.referenced_key_column = reference_column

              child_name = self.diagram_reader.database_diagram_members.tables_by_id[reference.end_point.target_object_id]
              table_child = self.diagram_reader.database_diagram_members.tables[child_name]
              relationship.child_table = table_child.name

              foreign_column = table_child.get_column_names()[reference.end_point.column_order]
              relationship.foreign_key_column = foreign_column

              database.relationships[database.relationships.length] = relationship
            end
          end
        end
      end
    end
  end
end
