class Rental < ActiveRecord::Base
  belongs_to :user
  belongs_to :town
  belongs_to :estate
  validates :name, presence: true
  validates :bedrooms, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  validates :estate_id, presence: true
  validates :town_id, presence: true
  has_many_attached :photos
  has_one_attached :cover_image
end
