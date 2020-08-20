class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :rentals, dependent: :destroy
  has_many :bookings
  has_many :town_users
  has_many :towns, through: :town_users
  has_one_attached :cover_photo
  has_one_attached :profile_picture
  validates :email, presence: true, uniqueness: true
  validates :town_ids, presence: true
  validates :phone_number, presence: true, uniqueness: true


  private
end
