class CreatePouchBlades < ActiveRecord::Migration[5.1]
  def change
    create_table :pouch_blades do |t|
      t.belongs_to :blade, foreign_key: true
      t.belongs_to :pouch, foreign_key: true

      t.timestamps
    end
  end
end
