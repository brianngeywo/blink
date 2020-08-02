class Town < ActiveRecord::Base
  has_many :town_users
  has_many :users, through: :town_users
  has_many :estates
  has_many :rentals
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
end
