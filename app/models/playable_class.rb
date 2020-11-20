class PlayableClass < ApplicationRecord
  include IconAttachment
  has_many :specializations
end
