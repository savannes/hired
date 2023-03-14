class CalendarEventsController < ApplicationController
  def new
    @calendar_events = CalendarEvent.new
    authorize @calendar_events
  end

  def create
  end
end
