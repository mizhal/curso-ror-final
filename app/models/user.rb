class User < ActiveRecord::Base
  attr_accessible :email, ## el email es el login
    :name, 
    :password, 
    :password_confirmation,
    :role_id, 
    :surname
    
  has_many :accommodations, 
    :foreign_key => :landlord_id,
    :dependent => :destroy
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
    :length => {minimum: 6, maximum: 64},
    :if => :password_changed?
  def password_changed?
    self.password.nil?
  end 
  validates :role_id, :presence => true
  validates :surname, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
  
  ### METODOS
  ###################################################
  
  def initialize(*params)
    super(*params)
    self.role_id = Role.find_by_name("landlord").id if self.role_id.blank?
  end
  
  def full_name
    self.name + " " + self.surname
  end
  
  def has_role? role_name
    return self.role.name == role_name.to_s unless self.role_id.blank?
    return false
  end
  
  ### FIN: METODOS
  ###################################################
  
  ### SCOPES
  ###################################################
  scope :landlords, joins(:role).where("roles.name = ?", "landlord")
  scope :administrators, joins(:role).where("roles.name = ?", "admin")
  ### FIN: SCOPES
  ###################################################
end
