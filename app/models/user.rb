class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
end
