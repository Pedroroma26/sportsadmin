class ReportsInstance < ApplicationRecord
  belongs_to :report
  belongs_to :player

  validates :category, inclusion: { in: %w[Goal Own-Goal Green-Card Yellow-Card Red-Card Sub-In Sub-Out Other] }
end
