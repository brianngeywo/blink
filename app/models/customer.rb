class Customer < ActiveRecord::Base
    validates :name, presence: true
    validates :phone_number, presence: true
    before_create :set_initial_state

    STATUS = {:waiting => nil, :completed => 1}
  
    def waiting
      if status.nil?
        self.status = STATUS[:waiting]
      end
    end
  
    def completed
      return if !status.nil?
      self.status = STATUS[:completed]
    end
  
    private
  
    def set_initial_state
      self.status = STATUS[:waiting] if status.nil?
    end
        
end
