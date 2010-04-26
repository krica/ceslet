class AddModelActionToIsLog < ActiveRecord::Migration
  def self.up
	add_column :is_logs, :model_name, :string
	add_column :is_logs, :action_name, :string
  end

  def self.down
	remove_column :is_logs, :model_name
	remove_column :is_logs, :action_name
  end
end
