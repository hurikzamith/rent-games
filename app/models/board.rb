class Board < ApplicationRecord
  belongs_to :user
  has_many :rents, dependent: :destroy

  validates :price, :rating, :title, :category, :player_number, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
