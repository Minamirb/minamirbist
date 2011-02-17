class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :event
      t.references :member

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
