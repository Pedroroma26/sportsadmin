class Club < ApplicationRecord
  acts_as_paranoid

  

  has_many :players, dependent: :destroy
  has_many :players_including_deleted, -> { with_deleted }, class_name: "Player"
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, length: { maximum: 30 }
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true # serve para confirmar o email
  validates :phone_number, length: { maximum: 15 }

  before_create :set_access_token

  private

  def set_access_token
    self.access_token = (0...32).map { (65 + rand(26)).chr }.join
  end

end
