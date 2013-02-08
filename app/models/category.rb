class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :children,
    :class_name => "Category",
    :foreign_key => :parent_id
  belongs_to :parent,
    :class_name => "Category",
    :foreign_key => :parent_id
  
  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
    
  ### VALIDACIONES
  ###################################
  validates :name, :presence => true,
    :uniqueness => true
  ### FIN: VALIDACIONES
  ###################################
    

end
