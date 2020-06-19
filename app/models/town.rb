class Town < ActiveRecord::Base
  has_many :estates
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
end
