class RoomType < ActiveRecord::Base
  attr_accessible :brief_description, 
    :description, 
    :characteristics,
    :name,
    :accommodation_id,
    :photos_attributes
  
  belongs_to :accommodation
  has_many :photos, :as => :image_owner,
    :dependent => :destroy
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
  validates :characteristics, :presence => true
  validates :name, :presence => true
  #validates :accommodation_id, :presence => true
  
  validates_uniqueness_of :name, :scope => :accommodation_id
   ## nombre unico dentro del establecimiento
  
  ### fin: VALIDACIONES
  #################################################
  
  ### METODOS
  ##################################################
  def main_photo cut
    return self.photos.first.image.url(cut) unless self.photos.empty?
    
    ConfigValue.default_image_for_model(:room_types, cut)
  end

  ### FIN: METODOS
  ##################################################
  
end
