class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :event_id
      t.integer :member_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
