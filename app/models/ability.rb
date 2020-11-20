class Ability < ApplicationRecord
  include IconAttachment
  belongs_to :specialization
end
