class CalendarEvent < ApplicationRecord
  belongs_to :job, optional: true
  delegate :user, to: :job
end
