class GuestList < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
