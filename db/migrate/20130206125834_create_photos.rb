class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :description
      t.integer :image_owner_id
      t.string :image_owner_type

      t.timestamps
    end
  end
end
