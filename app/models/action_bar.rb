class ActionBar < ApplicationRecord
  belongs_to :keymap
  has_many :action_buttons
end
