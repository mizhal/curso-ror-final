class Offer < ActiveRecord::Base
  attr_accessible :accommodation_id, 
    :description, 
    :name, 
    :price, 
    :summary
    
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
end
