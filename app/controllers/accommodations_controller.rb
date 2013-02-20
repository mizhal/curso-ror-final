class AccommodationsController < ApplicationController
  load_and_authorize_resource
  
  layout 'public_bar'
  
  # GET /accommodations
  # GET /accommodations.json
  def index
    if current_role? :landlord
      @accommodations = Accommodation
        .search_private(params, 4)
        .with_landlord(current_user_id)
      render layout: 'public_full'
    elsif current_role? :admin
      @accommodations = Accommodation
        .search_private(params, 4)
        .with_landlord(params[:landlord_id]) ## solo admin puede buscar por landlord
      render layout: 'admin'
    end
      
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
    @accommodation = Accommodation.find(params[:id])
  end

  # GET /accommodations/new
  # GET /accommodations/new.json
  def new
    @accommodation = Accommodation.new
    load_combo_data
    
    @accommodation.room_types.build
    @accommodation.photos.build
    
    render layout: 'public_full'
  end

  # GET /accommodations/1/edit
  def edit
    @accommodation = Accommodation.find(params[:id])
    load_combo_data
    
    @accommodation.room_types.build if @accommodation.room_types.empty?
    @accommodation.photos.build if @accommodation.photos.empty?
    
    render layout: 'public_full'
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(params[:accommodation])
    @accommodation.landlord = current_user unless can? :manage, Accommodation

    if @accommodation.save
      redirect_to @accommodation, notice: 'Accommodation was successfully created.'
    else
      load_combo_data
      render action: "new" 
    end
  end

  # PUT /accommodations/1
  # PUT /accommodations/1.json
  def update
    @accommodation = Accommodation.find(params[:id])

    if @accommodation.update_attributes(params[:accommodation])
      redirect_to @accommodation, notice: 'Accommodation was successfully updated.'
    else
      load_combo_data
      render action: "edit" 
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy
    
    flash[:notice] = t("controllers.accommodations.destroy_successful")
    
    redirect_to accommodations_path
  end
  
  def global_map
    @gmaps_json = Accommodation.all.to_gmaps4rails do |accommodation, marker|
      marker.infowindow render_to_string :partial => "accommodations/gmaps_infobox",
        :locals => accommodation.gmaps_custom_infobox_data
    end
    
    render :layout => 'public_full'
  end
  
  def public_index
    if current_role? :admin
      @accommodations = Accommodation
        .search_public(params, 9)
        .with_landlord(params[:landlord_id]) ## solo admin puede buscar por landlord
    else
      @accommodations = Accommodation.search_public(params, 9)
    end
  end
  
  def home
    @accommodations = Accommodation.home_page
    
    render :layout => 'public_full'
  end
  
  def publish
    accommodation = Accommodation.unpublished.find params[:id]

    if accommodation.update_attribute(:published, true)
      flash[:notice] = t("controllers.accommodations.publish.publication_successful")
    else
      flash[:error] = t("controllers.accommodations.publish.publication_failed")
    end
    
    redirect_to accommodations_path
  end

  def unpublish
    accommodation = Accommodation.published.find params[:id]

    if accommodation.update_attribute(:published, false)
      flash[:notice] = t("controllers.accommodations.publish.unpublication_successful")
    else
      flash[:error] = t("controllers.accommodations.publish.unpublication_failed")
    end
    
    redirect_to accommodations_path
  end
  
  def feature
    accommodation = Accommodation.published.find params[:id]
    #accommodation.featured = true
    
    if accommodation.update_attribute(:featured, true)
      flash[:notice] = t("controllers.accommodations.publish.setting_featured_successful")
    else
      flash[:error] = t("controllers.accommodations.publish.setting_featured_failed")
    end
    
    redirect_to accommodations_path
  end

  def unfeature
    accommodation = Accommodation.published.find params[:id]

    if accommodation.update_attribute(:featured, false)
      flash[:notice] = t("controllers.accommodations.publish.unsetting_featured_successful")
    else
      flash[:error] = t("controllers.accommodations.publish.unsetting_featured_failed")
    end
    
    redirect_to accommodations_path
  end
  
  ##
  ## Accion para llamada AJAX que actualiza el combo de provincias
  def provinces
    render json: Province.with_country_id(params[:country_id])
  end
  
  private
  def load_combo_data
    @countries = Country.order("name asc")
    @provinces = Province.siblings_including_self(@accommodation.province_id)
    @top_categories = Category.toplevel
    @landlords = User.landlords
    unless @accommodation.category_id.nil?
      @sibling_categories = Category.
        siblings_including_self_of(@accommodation.category_id) 
    else
      @sibling_categories = []
    end
  end
end
