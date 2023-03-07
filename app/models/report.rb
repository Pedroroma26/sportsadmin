class Report < ApplicationRecord
  belongs_to :game

  validates :referee_validation, presence: true
end
