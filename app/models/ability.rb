class Ability < ApplicationRecord
  belongs_to :specialization
  has_one_attached :icon
end
