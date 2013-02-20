class Accommodation < ActiveRecord::Base
  attr_accessible :address, 
    :slogan,
    :rooms_description,
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
    :longitude,
    :country_id,
    :parent_category_id
    
  belongs_to :province
  has_many :photos, :as => :image_owner,
    :dependent => :destroy
  has_many :offers,
    :dependent => :destroy
  has_many :room_types,
    :dependent => :destroy
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
    
    
  ### atributos virtuales
  def country_id
    return self.province.country_id unless self.province_id.nil?
    return nil
  end
  
  def country_id= country_id
  end
  
  def parent_category_id
    return self.category.parent_id unless self.category_id.nil?
    return nil
  end
  
  def parent_category_id= p_cat_id
  end
    
  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
      
  ### VALIDACIONES
  #########################################################
  
  validates :address, :presence => true
  validates :brief_description, :presence => true
  validates :slogan, :presence => true
  validates :rooms_description, :presence => true
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
  
  ### SCOPES
  #########################################################
  default_scope order("name asc")
  scope :published, where(:published => true)
  scope :unpublished, unscoped.where("published = false or published is null")
  scope :featured, where(:featured => true)
  scope :home_page, published.featured.order("created_at desc").limit(8)
  
  scope :published_state, lambda {|state| where(:published => state) unless state.blank?}
  scope :featured_state, lambda {|state| where(:featured => state) unless state.blank?}
  
  scope :from_province, lambda {|province_id| where(:province_id => province_id) unless province_id.blank? }
  scope :name_contains, lambda {|name| where("name like ?", "%#{name}%") unless name.blank?}
  scope :with_parent_category, lambda {|parent_category_id| 
    joins(:category).where("categories.parent_id" => parent_category_id) unless parent_category_id.blank?
  }
  scope :with_category, lambda {|category_id| where(:category_id => category_id) unless category_id.blank?}
  scope :with_landlord, lambda {|landlord_id| where(:landlord_id => landlord_id) unless landlord_id.blank?}
  
  scope :search_base, lambda { |hash|
    name_contains(hash[:name_contains])
    .from_province(hash[:province_id])
    .with_parent_category(hash[:parent_category_id])
    .with_category(hash[:category_id])    
  }
  scope :search_private, lambda { |hash, page_size|
    search_base(hash)
    .published_state(hash[:published])
    .featured_state(hash[:featured])
    .page(hash[:page])
    .per(page_size)
  }
  
  scope :search_public, lambda {|hash, page_size|
    published
    .search_base(hash)
    .page(hash[:page])
    .per(page_size)
  }
  
  ### Fin: SCOPES
  #########################################################  
  
  
  ### METODOS
  ##########################################################
  def full_category_path
    ## retorna la categoria padre y la categoria del alojamiento
    self.category.full_path.map{|c| c.name}
  end
  
  def main_photo cut
    return self.photos.first.image.url(cut) unless self.photos.empty?
    return ConfigValue.default_image_for_model(:accommodations, cut)
  end
  
  def full_address
    """#{self.address} #{self.postal_code} #{self.city} #{self.province.name}"""
  end
  
  def parent_category
    self.category.parent
  end
  
  def summary_first_line
    self.summary.split(/\n+/, 2).first
  end
  
  def summary_rest
    self.summary.split(/\n+/, 2).second    
  end

  ### Fin: METODOS
  ##########################################################

  
  ### mapas
  ####################################################
  acts_as_gmappable :process_geocoding => 
    lambda{ |accommodation| accommodation.latitude.nil? or accommodation.longitude.nil? }
  
  def gmaps4rails_address
    "#{self.address}, #{self.city}, #{self.province.country.name}" 
  end
  
  def gmaps4rails_marker_picture
    if self.category.icon.file?
      icon = self.category.icon.url(:icon)
    else
      icon = "http://maps.google.com/mapfiles/ms/micons/purple.png"
    end
    
    return { 
      "picture" => icon,
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
  ### fin: mapas
  ####################################################
  
  

end
