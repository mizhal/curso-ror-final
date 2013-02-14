class AddGmapsFieldsToAccommodation < ActiveRecord::Migration
  def change
    add_column :accommodations, :latitude,  :float
    add_column :accommodations, :longitude, :float 
    add_column :accommodations, :gmaps, :boolean
  end
end
