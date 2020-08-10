class Booking < ActiveRecord::Base
  belongs_to :town
  validates :location, presence: true
  validates :rooms, presence: true
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
