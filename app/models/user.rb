class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :role_id, :surname
end
