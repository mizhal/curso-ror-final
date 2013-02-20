class CreateConfigValues < ActiveRecord::Migration
  def change
    create_table :config_values do |t|
      t.string :key
      t.string :value
      t.boolean :required

      t.timestamps
    end
  end
end
