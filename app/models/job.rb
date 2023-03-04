class Job < ApplicationRecord
  belongs_to :user
  validates :company, :role, :level, :status, :job_type, :application_link, presence: true
  validates :salary, numericality: { only_integer: true }, allow_nil: true
  enum :status, { "Wishes" => 0, "Applications" => 1, "Interviews" => 2, "Tests" => 3, "Replies" => 4 }
end
