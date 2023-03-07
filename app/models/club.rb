class Club < ApplicationRecord
  has_many :players, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, length: { maximum: 5 }
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true # serve para confirmar o email
  validates :phone_number, length: { maximum: 15 }
end
