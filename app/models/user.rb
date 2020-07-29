class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :rentals
  has_many :bookings
  belongs_to :town

  private
end
