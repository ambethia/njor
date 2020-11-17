class ActionButton < ApplicationRecord
  belongs_to :action_bar
  belongs_to :category
end
