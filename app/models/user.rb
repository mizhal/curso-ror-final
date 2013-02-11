class User < ActiveRecord::Base
  attr_accessible :email, ## el email es el login
    :name, 
    :password, 
    :password_confirmation,
    :role_id, 
    :surname
    
  has_many :accommodations
  belongs_to :role
  
  has_secure_password
  
  ### slug
  extend FriendlyId
  friendly_id :email, :use => :slugged
  
  ### VALIDACIONES
  #################################################
  validates :email,
    :uniqueness => true,
    :format => {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
    
  validates :name, :presence => true
  validates :password, 
    :length => {minimum: 6, maximum: 64}
  validates :role_id, :presence => true
  validates :surname, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
  
  ### METODOS
  ###################################################
  
  def full_name
    self.name + " " + self.surname
  end
  
  def has_role? role_name
    self.role.name == role_name unless self.role_id.blank?
    return false
  end
  
  ### FIN: METODOS
  ###################################################
  
  ### SCOPES
  ###################################################
  scope :landlords, joins(:role).where("roles.name = ?", "landlord")
  ### FIN: SCOPES
  ###################################################
end
