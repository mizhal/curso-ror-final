module OffersHelper
  def offers_search_box
    render :partial => "offers/search_box", 
      :locals => {provinces: Province.all}
  end
end
