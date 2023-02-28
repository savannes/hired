class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :jobs
  validates :first_name, :last_name, presence: true
  # has_one_attached :avatar

  # def avatar_thumbnail
  #   avatar.variant(resize: "80x80!").processed
  # end
end
