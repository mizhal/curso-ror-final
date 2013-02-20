class ConfigValue < ActiveRecord::Base
  attr_accessible :key, :value, :photo_attributes

  has_one :photo, :as => :image_owner  
  accepts_nested_attributes_for :photo


  ### SCOPES
  ###################################################
  scope :default_image_for, lambda {|model_name|
    where(:key => "default_image.#{model_name}")
  }
  ### Fin: SCOPES
  ###################################################
  
  ### METODOS
  ##################################################
  def image cut
    return self.photo.image.url(cut) unless self.photo.nil?
    return "false.png"
  end
  
  def self.default_image_for_model model, cut
    found = default_image_for(model)
    return found.first.photo.image.url(cut) unless found.empty?
    return nil
  end
  ### Fin: METODOS
  ##################################################

end
