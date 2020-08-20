class CustomerBooking < ActiveRecord::Base
    belongs_to :rentals
    belongs_to :customers

    private
        
end
