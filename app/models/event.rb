class Event < ApplicationRecord
  belongs_to :host, :class_name => "User"
  has_many :comments
  has_many :guest_lists
  has_many :guests, through: :guest_lists, source: :user
  validates :name, :location, :state, :event_date, presence: true
  def city_state
    "#{self.location}, #{self.state}"
  end
end
