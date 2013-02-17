class Category < ActiveRecord::Base
  attr_accessible :name, :parent_id, :icon
  
  has_many :children,
    :class_name => "Category",
    :foreign_key => :parent_id
  belongs_to :parent,
    :class_name => "Category",
    :foreign_key => :parent_id
    
  has_many :accommodations
  
  has_attached_file :icon,
    :styles => {
      :icon => "32x32"
    }
  
  ### slug
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  
  ### scopes
  scope :toplevel, where(:parent_id => nil)
  scope :subcategories_of, lambda{|parent_id| where(:parent_id => parent_id) unless parent_id.blank?}
  scope :siblings_including_self_of, lambda{|subcategory| 
      where(:parent_id => subcategory.parent_id)
      .where("parent_id is not NULL")
    }
    
  ### VALIDACIONES
  ###################################
  validates :name, :presence => true
  validates_uniqueness_of :name, :scope => :parent_id
  validate :check_parent_id
  def check_parent_id
    unless Category.exists? self.parent_id or self.parent_id.blank?
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
  
  def is_subcategory?
    !self.parent_id.blank?
  end
  
  def secure_set_parent_id parent_id
    ## establecer parent id si y solo si es correcto
    self.parent_id = parent_id.to_i if Category.exists? parent_id.to_i
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
