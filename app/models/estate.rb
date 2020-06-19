class Estate < ActiveRecord::Base
  belongs_to :town
  has_many :rentals
  validates :name, presence: true, uniqueness: { case_sensitive: false }

    private
        
end
