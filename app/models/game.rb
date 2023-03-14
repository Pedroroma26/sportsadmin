class Game < ApplicationRecord
  acts_as_paranoid

  belongs_to :competition
  belongs_to :club_home, class_name: 'Club', foreign_key: 'club_home_id', required: true
  belongs_to :club_away, class_name: 'Club', foreign_key: 'club_away_id', required: true
  belongs_to :referee, class_name: 'User', foreign_key: 'referee_id', required: true
  has_one :report

  validates :game_date, presence: true
end
