class ReportInstance < ApplicationRecord
  acts_as_paranoid

  belongs_to :report, with_deleted: true
  belongs_to :player, optional: true

  validates :category, inclusion: { in: %w[Goal Own-Goal Green-Card Yellow-Card Red-Card Sub-In Sub-Out Other] }

  REPORT_INSTANCES_CATEGORIES = %w[Goal Own-Goal Green-Card Yellow-Card Red-Card Sub-In Sub-Out ]
end
