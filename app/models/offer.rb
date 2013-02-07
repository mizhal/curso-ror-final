class Offer < ActiveRecord::Base
  attr_accessible :accommodation_id, 
    :description, 
    :name, 
    :price, 
    :summary
    
  belongs_to :accommodation
  
  ### VALIDACIONES
  ###################################
  
  validates :accommodation_id, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => {greater_than: 0}
  validates :summary, :presence => true
  
  ### FIN: VALIDACIONES
  ###################################
end
