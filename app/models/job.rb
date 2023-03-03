class Job < ApplicationRecord
  belongs_to :user
  validates :company, :role, :level, :status, :job_type, :application_link, presence: true
  validates :salary, numericality: { only_integer: true }, allow_nil: true
  enum :status, { jobs: 0, applications: 1, interviews: 2, tests: 3, hired: 4  }
end
