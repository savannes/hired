class CalendarsController < ApplicationController
  def index
    # starts_at = params.fetch(:starts_at, Date.today).to_date

    # @events = current_user.calendar_events.where(starts_at: starts_at.beginning_of_month.beginning_of_week..starts_at.end_of_month.end_of_week)
    @events = CalendarEvent.all
    policy_scope(CalendarEvent)
  end
end


 # @events = current_user.calendar_events.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
