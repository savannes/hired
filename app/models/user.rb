class User < ApplicationRecord
  DEFAULT_COLUMNS = ["Wishes", "Applications", "Interviews", "Tests", "Replies"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :columns, dependent: :destroy
  has_many :jobs, through: :columns
  has_many :calendar_events, through: :jobs
  validates :first_name, :last_name, presence: true
  has_one_attached :avatar
  after_create :build_user_columns

  def build_user_columns
    DEFAULT_COLUMNS.each_with_index do |name, i|
      Column.create(user: self, name: name, position: i)
    end
  end
end
