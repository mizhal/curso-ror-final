class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.text :summary
      t.text :description
      t.float :price
      t.integer :accommodation_id

      t.timestamps
    end
  end
end
