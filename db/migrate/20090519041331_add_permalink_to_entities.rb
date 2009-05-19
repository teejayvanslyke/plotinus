class AddPermalinkToEntities < ActiveRecord::Migration
  def self.up
    add_column :entities, :permalink, :string
    add_index :entities, :permalink
  end

  def self.down
    remove_index :entities, :permalink
    remove_column :entities, :permalink
  end
end
