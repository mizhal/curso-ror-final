class Photo < ActiveRecord::Base
  attr_accessible :description, 
    :image_owner_id, 
    :image_owner_type, 
    :name
  
  has_attached_file :image,
    :styles => {
      :detail => "600x400",
      :thumbnail => "150x100"
    }
  
  belongs_to :image_owner, :polymorphic => true
end
