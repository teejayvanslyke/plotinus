class ChangeEntitiesInTriplesFromStringsToModels < ActiveRecord::Migration
  def self.up
    add_column :triples, :subject_id, :integer
    add_index :triples, :subject_id

    add_column :triples, :object_id, :integer
    add_index :triples, :object_id

    remove_column :triples, :entity1
    remove_column :triples, :entity2
  end

  def self.down
    add_column :triples, :entity1
    add_column :triples, :entity2

    remove_index :triples, :object_id
    remove_column :triples, :object_id

    remove_index :triples, :subject_Id
    remove_column :triples, :subject_id
  end
end
