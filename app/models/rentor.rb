class Rentor < ApplicationRecord
  belongs_to :user
  belongs_to :rental
  before_create :set_initial_state

  STATUS = {:uncompleted => nil, :completed => 1}

  def uncompleted
    if status.nil?
      self.status = STATUS[:uncompleted]
    end
  end

  def completed
    return if !status.nil?
    self.status = STATUS[:completed]
  end

  private

  def set_initial_state
    self.status = STATUS[:uncompleted] if status.nil?
  end
end
