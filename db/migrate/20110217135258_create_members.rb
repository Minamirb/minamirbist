class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :twitter_id
      t.string :blog
      t.date :birthday
      t.string :pr

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
