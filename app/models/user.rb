class User < ApplicationRecord
  has_many :boards, dependent: :destroy
  has_many :rents, dependent: :destroy
  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :address, :last_name, presence: true
end
