class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id
  
  has_many :children,
    :class_name => "Category",
    :foreign_key => :parent_id
  belongs_to :parent,
    :class_name => "Category",
    :foreign_key => :parent_id
    
  has_many :accommodations
  
  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  
  ### scopes
  scope :toplevel, where(:parent_id => nil)
    
  ### VALIDACIONES
  ###################################
  validates :name, :presence => true,
    :uniqueness => true
  validate :check_parent_id
  def check_parent_id
    unless Category.exists? self.parent_id
      errors.add :parent_id, I18n.t(
        "activerecord.errors.category.parent_id_not_exists"
      )
    end
  end
  
  ### FIN: VALIDACIONES
  ###################################
    
  ### METODOS
  ###################################
  def is_toplevel?
    self.parent_id.blank?
  end
  
  
  def secure_set_parent_id parent_id
    ## establecer parent id si y solo si es correcto
    @category.parent_id = parent_id if Category.exists? parent_id
  end
  ### FIN: METODOS
  ###################################
  
  ### CALLBACKS
  ###################################
  before_destroy :check_dependent_objects
  def check_dependent_objects
    ## no se deberian borrar categorias que tengan alojamientos
    unless self.accommodations.empty?
      self.errors.add I18n.t(
        "activerecord.errors.category.dependent_accommodations_exist"
        ), ''
      return false 
    end
    
    ## no se deberian borrar categorias que tengan subcategorias
    unless self.children.empty?
      self.errors.add I18n.t(
        "activerecord.errors.category.dependent_subcategories_exist"
        ), ''
      return false       
    end
  end
  
  ### FIN: CALLBACKS
  ###################################
  

end
