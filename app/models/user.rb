class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, through: :likes, source: :message

  def already_like_this?(clicked_message)
    self.favorites.include?(clicked_message)
  end

  def like_this(clicked_message)
    self.likes.find_or_create_by(message_id: clicked_message.id)
  end
end