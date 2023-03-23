class Column < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :jobs
end
