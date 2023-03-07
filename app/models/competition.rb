class Competition < ApplicationRecord
  has_many :games, dependent: :destroy
end
