class Town < ActiveRecord::Base
  belongs_to :user
  has_many :estates
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
end
