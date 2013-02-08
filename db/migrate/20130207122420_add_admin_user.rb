class AddAdminUser < ActiveRecord::Migration
  def up
    admin = User.new :name => "admin",
      :password => "123456",
      :email => "admin@localhost.es",
      :surname => "administradorez",
      :role_id => Role.find_by_name("admin").id
    admin.save!
  end

  def down
    User.find_by_email("admin@localhost.com").destroy
  end
end
