class Specialization < ApplicationRecord
  belongs_to :playable_class
  has_many :abilities
  has_one_attached :icon
end
