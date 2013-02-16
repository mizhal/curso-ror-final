class RoomType < ActiveRecord::Base
  attr_accessible :brief_description, 
    :description, 
    :name,
    :accommodation_id,
    :photos_attributes
  
  belongs_to :accommodation
  has_many :photos, :as => :image_owner
  accepts_nested_attributes_for :photos,
    :allow_destroy => true,
    :reject_if => lambda {|attrs| attrs[:image].nil?}

  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  ### VALIDACIONES
  #################################################
  
  validates :brief_description, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :accommodation_id, :presence => true
  
  validates_uniqueness_of :name, :scope => :accommodation_id
   ## nombre unico dentro del establecimiento
  
  ### fin: VALIDACIONES
  #################################################
end
