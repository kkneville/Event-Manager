class Event < ApplicationRecord
  belongs_to :host, :class_name => "User"
  has_many :comments, dependent: :destroy
  has_many :guest_lists, dependent: :destroy
  has_many :guests, through: :guest_lists, source: :user
  validates :name, :location, :state, :event_date, presence: true
  validate :future_dates_only
  def future_dates_only
    if self.event_date <= Date.today
      errors.add(:event_date, "The event date must be in the future")
    end
  end
  def city_state
    "#{self.location}, #{self.state}"
  end
end
