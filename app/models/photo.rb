class Photo < ActiveRecord::Base
  belongs_to :rental

  private
end
