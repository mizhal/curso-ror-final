class Country < ActiveRecord::Base
  attr_accessible :name
  
  has_many :provinces
  
  ### VALIDACIONES
  ###################################
  validates :name, :presence => true,
    :uniqueness => true
  ### Fin: VALIDACIONES
  ####################################
  
  
end
