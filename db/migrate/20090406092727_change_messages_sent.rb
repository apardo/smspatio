class ChangeMessagesSent < ActiveRecord::Migration
  def self.up
    change_column :messages, :sent, :boolean, :default => 0
  end

  def self.down
    change_column :messages, :sent, :boolean
  end
end
