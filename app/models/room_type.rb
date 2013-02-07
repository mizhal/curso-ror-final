class RoomType < ActiveRecord::Base
  attr_accessible :brief_description, :description, :name,
    :accommodation_id
  
  belongs_to :accomodation
  has_many :photos, :as => :image_owner
end
