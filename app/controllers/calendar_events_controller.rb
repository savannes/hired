class CalendarEventsController < ApplicationController
  def new
    @calendar_events = CalendarEvent.new
    authorize @calendar_events
  end

  def create
  # @calendar_events = CalendarEvent.new(params[:calendar_events])
  # @calendar_events.save
  # redirect_to new_calendar_event_path(@calendar_events)
  end
end

# private

# def calendar_event_params
#   params.require(:calendar_events).permit(:name, :description, :starts_at, :ends_at)
# end
