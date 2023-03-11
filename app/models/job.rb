class Job < ApplicationRecord
  belongs_to :column
  validates :company, :role, :level, :status, :job_type, :application_link, presence: true
  validates :salary, numericality: { only_integer: true }, allow_nil: true
  delegate :user, to: :column

  def status
    column.name
  end

  def search_fields
    "#{company} #{description}".downcase
  end
end
