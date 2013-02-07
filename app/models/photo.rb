class Photo < ActiveRecord::Base
  attr_accessible :description, :image_owner_id, 
    :image_owner_type, :name
  
  belongs_to :image_owner, :polymorphic => true
end
