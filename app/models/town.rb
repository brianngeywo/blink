class Town < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :estates
  has_many :rentals
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
end
