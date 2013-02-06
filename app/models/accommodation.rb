class Accommodation < ActiveRecord::Base
  attr_accessible :address, :brief_description, :category_id, :city, :description, :featured, :landlord_id, :name, :postal_code, :province_id
end
