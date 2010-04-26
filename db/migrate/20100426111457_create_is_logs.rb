class CreateIsLogs < ActiveRecord::Migration
  def self.up
    create_table :is_logs do |t|
      t.string :event
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :is_logs
  end
end
