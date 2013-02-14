class Accommodation < ActiveRecord::Base
  attr_accessible :address, 
    :brief_description, 
    :category_id, 
    :city, 
    :description, 
    :featured, 
    :landlord_id, 
    :name, 
    :postal_code, 
    :province_id, 
    :published,
    :phone,
    :email,
    :web,
    :room_types_attributes,
    :offers_attributes,
    :photos_attributes,
    :latitude,
    :longitude
    
  belongs_to :province
  has_many :photos, :as => :image_owner
  has_many :offers
  has_many :room_types
  belongs_to :category
  
  ## en este caso prefiero un nombre mas concreto para
  ## el propietario que el convencional "user"
  belongs_to :landlord, 
    :class_name => "User",
    :foreign_key => :landlord_id
    
    
  ### atributos anidados
  accepts_nested_attributes_for :room_types,
    :allow_destroy => true,
    :reject_if => :all_blank
  accepts_nested_attributes_for :offers,
    :allow_destroy => true,
    :reject_if => :all_blank
  accepts_nested_attributes_for :photos,
    :allow_destroy => true,
    :reject_if => :all_blank

    
  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  ### mapas
  acts_as_gmappable :process_geocoding => 
    lambda{ |accommodation| accommodation.latitude.nil? or accommodation.longitude.nil? }
  
  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.province.country.name}" 
  end
  
  def gmaps4rails_marker_picture
      { "picture" => self.category.icon.url(:icon),
        "width" => 32, 
        "height" => 32
      }
  end
  
  def gmaps_custom_infobox_data
    {
      title: self.name,
      content: self.brief_description,
      accommodation_id: self.id
    }
  end
    
  ### VALIDACIONES
  #########################################################
  
  validates :address, :presence => true
  validates :brief_description, :presence => true
  validates :category_id, :presence => true
  validates :city, :presence => true
  validates :description, :presence => true
  
  validates :landlord_id, :presence => true
  validates :name, :presence => true
    ## no valido unicidad de nombre porque creo que a priori
    ## no se puede asegurar que en distintas localidades no
    ## haya dos establecimientos con el mismo nombre
  validates :postal_code, :presence => true
  validates :province_id, :presence => true
  
  validates :phone,
    :format => {with: /[0-9 ]+/i}
  validates :email,
    :format => {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :web,
    :format => {with: /^http(s)?:\/\/([a-z0-9\-_]+[.])+([a-z0-9\-_]+)(\/([^\/\s]+))+$/i}
  
  ### FIN: VALIDACIONES
  #########################################################

end
