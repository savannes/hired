class CalendarEvent < ApplicationRecord
  belongs_to :job, optional: true
  delegate :user, to: :job
  validates :starts_at, :ends_at, presence: true
  validates :description, length: {maximum: 50}

  default_scope -> { order(:starts_at) }  # Our meetings will be ordered by their start_time by default

  def time
    "#{starts_at.strftime('%I:%M %p')} - #{ends_at.strftime('%I:%M %p')}"
  end

  def multi_days?
    (ends_at.to_date - starts_at.to_date).to_i >= 1
  end
end
