class AddIndicesToAssociationIds < ActiveRecord::Migration
  def change
    ## user -> role
    add_index :users, :role_id
    
    ## accommodation (- landlord) -> user
    add_index :accommodations, :landlord_id
    ## accommodation -> province
    add_index :accommodations, :province_id
    ## accommodation -> category
    add_index :accommodations, :category_id
    
    ## provice -> country
    add_index :provinces, :country_id
    
    ## category -> category
    add_index :categories, :parent_id
    
    ## offer -> accommodation
    add_index :offers, :accommodation_id
    
    ## roomtype -> accommodation
    add_index :room_types, :accommodation_id
    
    ## photo -> "image_owner"
    add_index :photos, [:image_owner_id, :image_owner_type] 
    
  end
end
