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
  has_many :rentors
  before_create :set_initial_state

  STATUS = {:unverified => nil, :verified => 1}

  def unverified
    if status.nil?
      self.status = STATUS[:unverified]
    end
  end

  def verified
    return if !status.nil?
    self.status = STATUS[:verified]
  end

  private

  def set_initial_state
    self.status = STATUS[:unverified] if status.nil?
  end
end
