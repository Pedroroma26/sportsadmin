class Report < ApplicationRecord
  belongs_to :game
  has_many :report_instances
  has_many :players, through: :report_instances

  validates :referee_validation, presence: true
end
