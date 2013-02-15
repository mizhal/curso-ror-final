class AccommodationsController < ApplicationController
  load_and_authorize_resource
  
  # GET /accommodations
  # GET /accommodations.json
  def index
    @accommodations = Accommodation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accommodations }
    end
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accommodation }
    end
  end

  # GET /accommodations/new
  # GET /accommodations/new.json
  def new
    @accommodation = Accommodation.new
    load_combo_data
    
    2.times do 
      @accommodation.room_types.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accommodation }
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

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully created.' }
        format.json { render json: @accommodation, status: :created, location: @accommodation }
      else
        format.html { 
          load_combo_data
          render action: "new" }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accommodations/1
  # PUT /accommodations/1.json
  def update
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      if @accommodation.update_attributes(params[:accommodation])
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { 
          load_combo_data
          render action: "edit" }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy

    respond_to do |format|
      format.html { redirect_to accommodations_url }
      format.json { head :no_content }
    end
  end
  
  def global_map
    @gmaps_json = Accommodation.all.to_gmaps4rails do |accommodation, marker|
      marker.infowindow render_to_string :partial => "accommodations/gmaps_infobox",
        :locals => accommodation.gmaps_custom_infobox_data
    end
    
  end
  
  private
  def load_combo_data
    @countries = Country.order("name asc")
    @provinces = Province.all
    @top_categories = Category.toplevel
    @subcategories = Category.where("parent_id is not NULL")
    @landlords = User.landlords
  end
end
