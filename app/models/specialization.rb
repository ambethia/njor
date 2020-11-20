class Specialization < ApplicationRecord
  include IconAttachment
  belongs_to :playable_class
  has_many :abilities
end
