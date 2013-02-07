class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :role_id, 
    :surname
    
  has_many :accommodations
  belongs_to :role
end
