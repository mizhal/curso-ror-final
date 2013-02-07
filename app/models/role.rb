class Role < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users
  
    ### VALIDACIONES
  #################################################
  validates :name, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
end
