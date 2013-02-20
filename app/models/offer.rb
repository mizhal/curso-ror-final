class Offer < ActiveRecord::Base
  attr_accessible :accommodation_id, 
    :description, 
    :name, 
    :price, 
    :summary,
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
  ###################################
  
  validates :accommodation_id, :presence => true
  validates :description, :presence => true
  validates :name, :presence => true
  validates :price, :numericality => {greater_than: 0}
  validates :summary, :presence => true
  
  ### FIN: VALIDACIONES
  ###################################
  
  ### SCOPES
  #####################################
  default_scope order("created_at desc")
  scope :published, joins("left join accommodations on offers.accommodation_id = accommodations.id")
    .where("accommodations.published" => true)
  scope :name_contains, lambda { |name| where("name like (?)", "%#{name}%") unless name.blank? }
  scope :from_province, lambda { |province_id| 
    where("accommodations.province_id" => province_id) unless province_id.blank?
  }
  
  
  ### Fin: SCOPES
  #####################################
  
  ### METODOS
  ######################################  
  def main_photo cut
    return self.photos.first.image.url(cut) unless self.photos.empty?
    
    ConfigValue.default_image_for_model(:offers, cut)
  end
  
  ### Fin: METODOS
  ######################################
    
end
