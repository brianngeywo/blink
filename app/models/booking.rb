class Booking < ActiveRecord::Base
  belongs_to :town
  validates :location, presence: true
  validates :rooms, presence: true

  private
end
