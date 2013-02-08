class AddDefaultGroups < ActiveRecord::Migration
  def up
   Role.create :name => "admin"
   Role.create :name => "landlord"
  end

  def down
   Role.find_by_name("admin").destroy
   Role.find_by_name("landlord").destroy
  end
end
