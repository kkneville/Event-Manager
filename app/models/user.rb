class User < ApplicationRecord
  has_secure_password
  has_many :event
  has_many :events, through: :guest_lists
  has_many :comments
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :email, :first_name, :state, :location, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, uniqueness: true
  validates :password, length: {in: 8..32}, unless: :skip_pw
  validates :password, presence: true, unless: :skip_pw

  def name
    return "#{self.first_name} #{self.last_name}"
  end

  before_save :email_lowercase
  def email_lowercase
    self.email.downcase!
  end

  def skip_pw
    true
  end
end
