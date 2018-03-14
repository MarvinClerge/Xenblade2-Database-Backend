class Blade < ApplicationRecord
  has_many :pouch_blades
  has_many :pouches, through: :pouch_blades
end
