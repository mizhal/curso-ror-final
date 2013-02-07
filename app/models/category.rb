class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :children,
    :class_name => "Category",
    :foreign_key => :parent_id
  belongs_to :parent,
    :class_name => "Category",
    :foreign_key => :parent_id
    
  ### VALIDACIONES
  ###################################
  validates :name, :presence => true
  ### FIN: VALIDACIONES
  ###################################
    

end
