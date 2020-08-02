class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :rentals
  has_many :bookings
  has_many :town_users
  has_many :towns, through: :town_users
  has_one_attached :cover_photo
  has_one_attached :profile_picture

  private
end
