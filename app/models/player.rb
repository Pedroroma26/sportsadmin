class Player < ApplicationRecord
  belongs_to :club

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true, inclusion: { in: %w[male female other] }
end
