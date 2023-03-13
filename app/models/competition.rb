class Competition < ApplicationRecord
  acts_as_paranoid
  
  has_many :games, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
