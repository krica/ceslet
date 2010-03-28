class AddNameRoleToUser < ActiveRecord::Migration
  def self.up
	add_column :users, :role_id, :integer
	add_column :users, :lastname, :string
  end

  def self.down
	remove_column :users, :lastname
	remove_column :users, :role_id
  end
end
