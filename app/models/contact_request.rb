class ContactRequest
  ### ACTIVEMODEL
  ###################################################
  ## generador de getters y setters
  include ActiveModel::AttributeMethods
  ## para validaciones
  include ActiveModel::Validations
  ## nombres en vistas
  include ActiveModel::Naming
  ## soporte de traduccion
  include ActiveModel::Translation
  ### Fin: ACTIVEMODEL
  ###################################################  
  
  attr_accessor :name,
    :company,
    :email,
    :phone,
    :comments,
    :accept_privacy_policy
    
  ### VALIDACIONES
  ####################################################
  validates :name, :presence => true
  validates :company, :presence => true
  validates :email, :presence => true,
    :format => {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :phone,
    :format => {with: /[0-9 ]+/i}
  validates :comments, :presence => true
  validates :accept_privacy_policy,
    :acceptance => true
  ### Fin: VALIDACIONES
  ####################################################  
  
  ### METODOS
  ####################################################
  def initialize(hash_ = nil) ## creacion masiva
    hash_ && hash_.each do |name, value|
      send("#{name}=", value) if respond_to? name.to_sym 
    end    
  end
  
  ### FIN: METODOS
  #####################################################
  
end