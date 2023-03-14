class Player < ApplicationRecord
  acts_as_paranoid

  belongs_to :club
  has_many :report_instances

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :player_number, presence: true, length: { in: 0..99 }
  validates :gender, presence: true, inclusion: { in: %w[male female other] }

  def full_name
    "#{first_name} #{last_name}"
  end
end
