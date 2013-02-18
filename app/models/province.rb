class Province < ActiveRecord::Base
  attr_accessible :country_id, 
    :name
  
  belongs_to :country
  
  ### VALIDACIONES
  #################################################
  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => :country_id
  validates :country_id, :presence => true
  
  ### fin: VALIDACIONES
  #################################################
  
  ### SCOPES
  ##################################################
  default_scope order("name asc")
  scope :with_country_id, lambda {|country_id| where(:country_id => country_id)}
  scope :siblings_including_self, lambda {|province_id| 
    unless province_id.nil? or not exists? province_id
      with_country_id(find(province_id).country_id) 
    else
      where("false") ## evitar que si no hay me saque todos
    end
  }
  ### Fin: SCOPES
  ##################################################
  
end
