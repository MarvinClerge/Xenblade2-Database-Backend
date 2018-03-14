class CreatePouches < ActiveRecord::Migration[5.1]
  def change
    create_table :pouches do |t|
      t.string :name
      t.string :rarity
      t.string :category
      t.string :location
      t.string :duration
      t.string :effects, array: true

      t.timestamps
    end
  end
end
