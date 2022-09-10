class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  # :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :operations, dependent: :destroy
  has_many :groups, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
