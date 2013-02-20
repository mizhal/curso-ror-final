class ConfigValuesController < ApplicationController
  load_and_authorize_resource
  
  layout 'admin'  
  
  
  # GET /config_values
  # GET /config_values.json
  def index
    @config_values = ConfigValue
      .page(params[:page])
      .per(10)
  end

  # GET /config_values/new
  # GET /config_values/new.json
  def new
    @config_value = ConfigValue.new
  end

  # GET /config_values/1/edit
  def edit
    @config_value = ConfigValue.find(params[:id])
  end

  # POST /config_values
  # POST /config_values.json
  def create
    @config_value = ConfigValue.new(params[:config_value])
    if @config_value.save
      redirect_to config_values_path, notice: 'Config value was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /config_values/1
  # PUT /config_values/1.json
  def update
    @config_value = ConfigValue.find(params[:id])

    if @config_value.update_attributes(params[:config_value])
      redirect_to config_values_path, notice: 'Config value was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  # DELETE /config_values/1
  # DELETE /config_values/1.json
  def destroy
    @config_value = ConfigValue.find(params[:id])
    @config_value.destroy

    redirect_to config_values_url
  end
end
