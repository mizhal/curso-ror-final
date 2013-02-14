class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name
      t.text :brief_description
      t.text :description
      t.integer :accommodation_id

      t.timestamps
    end
  end
end
