class FillRoles < ActiveRecord::Migration
  def self.up
	Role.new do |r|
      r.name = "admin"
      r.save
    end
	Role.new do |r|
      r.name = "editor"
      r.save
    end
	Role.new do |r|
      r.name = "observer"
      r.save
    end
  end

  def self.down
	Role.find_by_name("admin").destroy
	Role.find_by_name("editor").destroy
	Role.find_by_name("observer").destroy
  end
end
