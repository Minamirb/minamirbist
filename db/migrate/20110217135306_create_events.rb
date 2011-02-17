class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.date :date_on
      t.string :name
      t.string :place
      t.string :contents

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
