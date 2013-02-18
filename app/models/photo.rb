class Photo < ActiveRecord::Base
  attr_accessible :description, 
    :image_owner_id, 
    :image_owner_type, 
    :name,
    :image
  
  has_attached_file :image,
    :styles => {
      :detail => "600x400",
      :thumbnail => "190x125"
    }
  
  belongs_to :image_owner, :polymorphic => true
  
  ### VALIDACIONES
  #################################################
  validates :image, :presence => true
  ### fin: VALIDACIONES
  #################################################
  
end
