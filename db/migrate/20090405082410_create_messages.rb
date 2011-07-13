class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :body
      t.integer :user_id
      t.boolean :sent

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end