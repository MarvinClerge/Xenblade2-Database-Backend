class CreatePouches < ActiveRecord::Migration[5.1]
  def change
    create_table :pouches do |t|
      t.string :name
      t.string :rarity
      t.string :category
      t.string :location
      t.string :duration
      t.string :first_effect, array: true
      t.string :second_effect, array: true
      t.string :third_effect, array: true
      t.string :shop

      t.timestamps
    end
  end
end
