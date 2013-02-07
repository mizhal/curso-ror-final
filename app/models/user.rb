class User < ActiveRecord::Base
  attr_accessible :email, ## el email es el login
    :name, 
    :password, 
    :role_id, 
    :surname
    
  has_many :accommodations
  belongs_to :role
  
  ### VALIDACIONES
  #################################################
  validates :email,
    :format => {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
    :uniqueness => true
  validates :name, :presence => true
  validates :password, :length => {minimum: 6, maximum: 64}
  validates :role_id, :presence => true
  validates :surname, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
end
