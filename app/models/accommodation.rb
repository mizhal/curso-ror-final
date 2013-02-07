class Accommodation < ActiveRecord::Base
  attr_accessible :address, ## direccion local: calle, numero, etc
    :brief_description, ## slogan o descripcion breve de los servicios y caracteristicas
    :category_id, ## id de la categoria en la que se encuadra el establecimiento
    :city, ## poblacion donde se situa el establecimiento
    :description, ## descripcion extensa del establecimiento
    :featured, ## cierto si y solo si es un establecimiento destacado
    :landlord_id, ## id del propietario
    :name, ## nombre del establecimiento
    :postal_code, ## codigo postal
    :province_id, ## id de la provincia donde se situa el establecimiento
    :published ## cierto si y solo si esta visible publicamente en la web 
    
  belongs_to :province 
  has_many :photos 
  has_many :offers 
  has_many :room_types
  belongs_to :category
  
  ## en este caso prefiero un nombre mas concreto para
  ## el propietario que el convencional "user"
  belongs_to :landlord, 
    :class_name => "User",
    :foreign_key => :landlord_id
    
    
  ### VALIDACIONES
  #########################################################
  
  validates :address, :presence => true
  validates :brief_description, :presence => true
  validates :category_id, :presence => true
  validates :city, :presence => true
  validates :description, :presence => true
  
  validates :landlord_id, :presence => true
  validates :name, :presence => true
  validates :postal_code, :presence => true
  validates :province_id, :presence => true
  
  ### FIN: VALIDACIONES
  #########################################################
  
  
    
  
end
