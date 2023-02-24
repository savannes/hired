class Job < ApplicationRecord
  belongs_to :user
  validates :role, :level, :status, :type, :application_link, presence: true
  validates :salary, numericality: { only_integer: true }, allow_nil: true
end
