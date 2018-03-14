class Pouch < ApplicationRecord
  has_many :pouch_blades
  has_many :blades, through: :pouch_blades
end
