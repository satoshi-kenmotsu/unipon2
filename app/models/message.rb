class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true
  validates :takername, presence: true

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end