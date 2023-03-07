class ReportsInstance < ApplicationRecord
  belongs_to :report
  belongs_to :player

  validates :type, inclusion: { in: %w[Goal Own-Goal Green-Card Yellow-Card Red-Card] }
  validates :minute, presence: true
end
