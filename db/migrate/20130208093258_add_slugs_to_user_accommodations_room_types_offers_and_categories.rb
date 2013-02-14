class AddSlugsToUserAccommodationsRoomTypesOffersAndCategories < ActiveRecord::Migration
  def change
    ## slug de users
    add_column :users, :slug, :string
    add_index :users, :slug, :unique => true
    
    ## slug de accommodations
    add_column :accommodations, :slug, :string
    add_index :accommodations, :slug, :unique => true
    
    ## slug de room_types
    add_column :room_types, :slug, :string
    add_index :room_types, :slug, :unique => true
    
    ## slug de offers
    add_column :offers, :slug, :string
    add_index :offers, :slug, :unique => true
    
    ## slug de categories
    add_column :categories, :slug, :string
    add_index :categories, :slug, :unique => true
  end
end
