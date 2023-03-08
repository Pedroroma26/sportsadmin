class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :email, presence: true, uniqueness: true, confirmation: true # serve para confirmar o email
  validates :phone_number, length: { maximum: 15 }

  enum :role, {
    organizer: 0,
    referee: 1
  }

  def full_name
    "#{first_name} #{last_name}"
  end
end
