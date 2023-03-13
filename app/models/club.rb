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
end
