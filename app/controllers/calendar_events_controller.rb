class CalendarEventsController < ApplicationController
  # after_action :verify_policy_scoped, only: :create
  def new
    @calendar_events = CalendarEvent.new
    authorize @calendar_events
  end

  def create
    @calendar_events = CalendarEvent.new(name: params[:calendar_event][:name],
      description: params[:calendar_event][:description],
        starts_at: Time.new(params[:calendar_event]["starts_at(1i)"].to_i,
        params[:calendar_event]["starts_at(2i)"].to_i,
        params[:calendar_event]["starts_at(3i)"].to_i,
        params[:calendar_event]["starts_at(4i)"].to_i,
        params[:calendar_event]["starts_at(5i)"].to_i),
        ends_at: Time.new(params[:calendar_event]["ends_at(1i)"].to_i,
        params[:calendar_event]["ends_at(2i)"].to_i,
        params[:calendar_event]["ends_at(3i)"].to_i,
        params[:calendar_event]["ends_at(4i)"].to_i,
        params[:calendar_event]["ends_at(5i)"].to_i))
    if @calendar_events.save
      redirect_to calendar_path(@calendar_events)
    else
      render :new
    end
    authorize @calendar_events
    # @calendar_events.user = current_user
  end

  def destroy
    @calendar_event = CalendarEvent.find(params[:id])
    @calendar_event.destroy
    authorize @calendar_event
    redirect_to calendar_path, notice: "Meeting Deleted"
  end

private

def calendar_event_params
  params.require(:calendar_events).permit(:name, :description, :starts_at, :ends_at)
end

end
