class Accommodation < ActiveRecord::Base
  attr_accessible :address, 
    :brief_description, 
    :category_id, 
    :city, 
    :description, 
    :featured, 
    :landlord_id, 
    :name, 
    :postal_code, 
    :province_id, 
    :published
    
  belongs_to :province
  has_many :photos
  has_many :offers
  has_many :room_types
  belongs_to :category
  
  ## en este caso prefiero un nombre mas concreto para
  ## el propietario que el convencional "user"
  belongs_to :landlord, 
    :class_name => "User",
    :foreign_key => :landlord_id
    
  ### VALIDACIONES
  #########################################################
  
  validates :address, :presence => true
  validates :brief_description, :presence => true
  validates :category_id, :presence => true
  validates :city, :presence => true
  validates :description, :presence => true
  
  validates :landlord_id, :presence => true
  validates :name, :presence => true
  validates :postal_code, :presence => true
  validates :province_id, :presence => true
  
  ### FIN: VALIDACIONES
  #########################################################

end
