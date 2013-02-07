class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :brief_description
      t.text :description
      t.integer :province_id
      t.string :city
      t.string :address
      t.integer :postal_code
      t.boolean :featured
      t.boolean :published
      t.integer :category_id
      t.integer :landlord_id

      t.timestamps
    end
  end
end
