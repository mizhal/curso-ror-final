class AddAdminUser < ActiveRecord::Migration
  def up
    User.create! :name => "admin",
      :password => "123456",
      :email => "admin@localhost.es",
      :surname => "administradorez",
      :role_id => Role.find_by_name("admin").id
  end

  def down
    User.find_by_email("admin@localhost.com").destroy
  end
end
