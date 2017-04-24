class EventController < ApplicationController
  def new
    event = Event.new
  end

  def index
    # needed context for event/index page
    @states = State.all
    @events_all = Event.all
    @events_in_state = Event.where('state = ? AND event_date >= ?', current_user.state, Date.today).order(:event_date)
    @events_out_of_state = Event.where('state != ? AND event_date >= ?', current_user.state, Date.today).order(:event_date).take(6)
    # possible context for the add event form at bottom
    @event = Event.new()
    @event = Event.new(session[:event]) if flash[:errors] != nil && session[:event] != nil
  end

  def create
    @event = Event.new( event_params )
    @event.host = current_user

    if @event.save == false
      flash[:errors] = @event.errors.full_messages
      session[:event] = @event
    end
    redirect_to event_index_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if current_user == @event.host
    redirect_to event_index_path
  end

  def update
    @event = Event.find(params[:id])
    @event.attributes = event_params
    if @event.save
      redirect_to event_index_path
    else
      flash[:errors] = @event.errors.full_messages
      session[:event] = @event
      redirect_to event_show_path(params[:id])
    end
  end

  def show
    @event = Event.find(params[:id])
    @states = State.all
    @event_comments = @event.comments.order(created_at: :desc )
    @event = Event.new(session[:event]) if flash[:errors] != nil && session[:event] != nil
    render layout: "two_cols"
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :state, :event_date)
    end

end
