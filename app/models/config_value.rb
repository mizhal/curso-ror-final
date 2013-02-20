class ConfigValue < ActiveRecord::Base
  attr_accessible :key, :value
  
  has_one :photo, :as => :image_owner
  
  ### METODOS
  ##################################################
  def image cut
    return self.photo.image.url(cut) unless self.photo.nil?
    return "false.png"
  end
  ### Fin: METODOS
  ##################################################

end
