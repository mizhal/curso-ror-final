class AccommodationsController < ApplicationController
  load_and_authorize_resource
  
  layout 'public'
  
  # GET /accommodations
  # GET /accommodations.json
  def index
    @accommodations = Accommodation.all
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
    
    2.times do 
      @accommodation.room_types.build
    end
  end

  # GET /accommodations/1/edit
  def edit
    @accommodation = Accommodation.find(params[:id])
    load_combo_data
    
    if @accommodation.room_types.empty?
      @accommodation.room_types.build
    end
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
    render layout: 'application'
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
