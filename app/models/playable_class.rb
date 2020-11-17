class PlayableClass < ApplicationRecord
  has_many :specializations
  has_one_attached :icon
end
