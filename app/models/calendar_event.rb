class CalendarEvent < ApplicationRecord
  belongs_to :job
  delegate :user, to: :job
end
