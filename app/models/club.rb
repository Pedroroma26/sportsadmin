class Club < ApplicationRecord
  has_many :players, dependent: :destroy
end
