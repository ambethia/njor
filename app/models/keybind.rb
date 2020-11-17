class Keybind < ApplicationRecord
  belongs_to :specialization
  belongs_to :action_button
  belongs_to :ability
end
