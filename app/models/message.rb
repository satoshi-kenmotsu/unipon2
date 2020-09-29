class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  has_many :likes
  has_many :users, through: :likes
end