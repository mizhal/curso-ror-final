class Role < ActiveRecord::Base
  attr_accessible :name
  
  has_many :users
  
    ### VALIDACIONES
  #################################################
  validates :name, :presence => true,
    :uniqueness => true
  
  ### fin: VALIDACIONES
  #################################################
end
