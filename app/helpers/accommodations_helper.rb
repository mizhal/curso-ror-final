module AccommodationsHelper
  
  def print_full_category accommodation
    raw link_to( 
        accommodation.
          full_category_path.
          join(" #{t("helpers.accommodations.print_full_category.category_joiner")} "), 
        public_index_accommodations_url(
          :category_id => accommodation.category_id
          )
      )
  end
  
  def category_navigator
    render :partial => "category_navigator",
      :locals => {categories: Category.toplevel}
  end
  
  def accommodations_search_box action
    landlords = []
    landlords = User.landlords if can? :manage, Accommodation
    
    render :partial => "search_box",
      :locals => {
        action: action,
        provinces: Province.where("true"),
        categories: Category.toplevel,
        landlords: landlords
      }
  end
end
