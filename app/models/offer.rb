class Offer < ActiveRecord::Base
  attr_accessible :accommodation_id, :description, :name, 
    :price, :summary
    
  belongs_to :accommodation
end
