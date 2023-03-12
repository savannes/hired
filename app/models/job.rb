class Job < ApplicationRecord
  ROLE = ["Full Stack", "Front-End", "Back-End"].freeze
  belongs_to :column
  validates :company, :role, :level, :status, :job_type, :application_link, presence: true
  validates :salary, numericality: { only_integer: true }, allow_nil: true
  validates :role, inclusion: { in: ROLE }
  delegate :user, to: :column
  has_many :calendar_events, dependent: :destroy

  def status
    column.name
  end

  def search_fields
    "#{company} #{description}".downcase
  end
end
