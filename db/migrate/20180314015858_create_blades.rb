class CreateBlades < ActiveRecord::Migration[5.1]
  def change
    create_table :blades do |t|
      t.text :name
      t.text :element
      t.text :role
      t.text :weapon
      t.text :aux_cores
      t.text :modifier_stat
      t.text :modifier_value
      t.text :physical_defense
      t.text :ether_defense
      t.text :battle_skills, array: true
      t.text :field_skills, array: true
      t.text :blade_arts, array: true
      t.text :pouch_categories, array: true
      t.text :obtained

      t.timestamps
    end
  end
end
