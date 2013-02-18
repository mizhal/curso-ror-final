class OffersController < ApplicationController
  load_and_authorize_resource :accommodation, :except => [:public_index]
  load_and_authorize_resource
  
  layout 'public'
  
  # GET /offers
  # GET /offers.json
  def index
    @accommodation = Accommodation.find params[:accommodation_id]
    @offers = @accommodation.offers
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new :accommodation_id => params[:accommodation_id]
    @offer.photos.build
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(params[:offer])

    if @offer.save
      redirect_to [@offer.accommodation, @offer], 
        notice: 'Offer was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    if @offer.update_attributes(params[:offer])
      redirect_to [@offer.accommodation, @offer], 
        notice: 'Offer was successfully updated.'
    else
      @accommodation = @offer.accommodation
      render action: "edit"
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    redirect_to accommodation_offers_url(@offer.accommodation)
  end
  
  ## GET /offers/public_index(.:format) 
  def public_index
    offer = Offer.published.first
    @offers = []
    9.times do
      @offers << offer
    end
    
    @provinces = Province.all
  end
end
