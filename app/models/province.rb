class Province < ActiveRecord::Base
  attr_accessible :country_id, 
    :name
  
  belongs_to :country
  
  ### VALIDACIONES
  #################################################
  validates :name, :presence => true,
    :uniqueness => true
  validates :country_id, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
end
