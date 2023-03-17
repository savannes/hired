class RemoveJobFromCalendarEvent < ActiveRecord::Migration[7.0]
  def change
    change_column_null :calendar_events, :job_id, true
  end
end
