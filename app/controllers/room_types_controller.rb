class RoomTypesController < ApplicationController
  load_and_authorize_resource :accommodation
  load_and_authorize_resource :room_type, :through => :accommodation
  ## la autorizacion es sobre el objeto accommodation asociado, no sobre el objeto roomtype
  
  layout 'public_full'
  
  # GET /room_types
  # GET /room_types.json
  def index
    @accommodation = Accommodation.find params[:accommodation_id]
    @room_types = @accommodation.room_types

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @room_types }
    end
  end

  # GET /room_types/1
  # GET /room_types/1.json
  def show
    @room_type = RoomType.find(params[:id])
    @accommodation = Accommodation.find params[:accommodation_id]
    
    render :layout => "public_bar"
  end

  # GET /room_types/new
  # GET /room_types/new.json
  def new
    @accommodation = Accommodation.find params[:accommodation_id]
    @room_type = RoomType.new :accommodation_id => @accommodation.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_type }
    end
  end

  # GET /room_types/1/edit
  def edit
    @room_type = RoomType.find(params[:id])
    @accommodation = Accommodation.find params[:accommodation_id]
  end

  # POST /room_types
  # POST /room_types.json
  def create
    @room_type = RoomType.new(params[:room_type])
    @accommodation = Accommodation.find params[:accommodation_id]

    if @room_type.save
      redirect_to accommodation_room_type_path(@accommodation, @room_type), 
        notice: 'Room type was successfully created.'
    else
      render action: "new" 
    end
  end

  # PUT /room_types/1
  # PUT /room_types/1.json
  def update
    @room_type = RoomType.find(params[:id])
    @accommodation = Accommodation.find params[:accommodation_id]

    if @room_type.update_attributes(params[:room_type])
      redirect_to accommodation_room_type_path(@accommodation, @room_type),
        notice: 'Room type was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /room_types/1
  # DELETE /room_types/1.json
  def destroy
    @room_type = RoomType.find(params[:id])
    @room_type.destroy

    @accommodation = Accommodation.find params[:accommodation_id]
    redirect_to accommodation_room_types_url(@accommodation)

  end
end
