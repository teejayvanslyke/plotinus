class CreateTriples < ActiveRecord::Migration
  def self.up
    create_table :triples do |t|
      t.string :entity1
      t.string :entity2
      t.integer :predicate_id
      t.integer :author_id
      t.integer :domain_id

      t.timestamps
    end
  end

  def self.down
    drop_table :triples
  end
end
