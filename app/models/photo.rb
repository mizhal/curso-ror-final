class Photo < ActiveRecord::Base
  attr_accessible :description, 
    :image_owner_id, 
    :image_owner_type, 
    :name,
    :image
  
  has_attached_file :image,
    :styles => {
      :detail => ["600x300>", 'png'],
      :thumbnail => ["200x100>", 'png'],
      :micro => ["50x50", "png"]
    },
    :convert_options => {
      :detail => "-background transparent -gravity center -extent 600x300",
      :thumbnail => "-background transparent -gravity center -extent 200x100",
      :micro => "-background transparent -gravity center -extent 50x50"
    }
  
  belongs_to :image_owner, :polymorphic => true
  
  ### VALIDACIONES
  #################################################
  validates :image, :presence => true
  ### fin: VALIDACIONES
  #################################################
  
end
