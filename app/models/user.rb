class User < ActiveRecord::Base
  has_many :rentals
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_secure_password
  private
end
