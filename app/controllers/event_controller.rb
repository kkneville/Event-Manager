class EventController < ApplicationController
  def new
    event = Event.new
  end

  def index
    @states = State.all
    @events_all = Event.all
    @events_in_state = Event.where(state: current_user.state)
    @events_out_of_state = Event.where.not(state: current_user.state).order(:event_date).take(10)
    @event = Event.new
    # puts '==================='
    # @ee = Event.find(3)
    # puts @ee.guests
    # puts current_user
    # @ee.guests.each do |g|
    #   puts g.name
    # end
    # puts '==================='
    # puts GuestList.where(user_id: 1, event_id: 3 ).count
    # puts GuestList.where(user_id: 1, event_id: 4 ).count
    # puts '==================='
  end

  def create
    @event = Event.new( event_params )
    @event.host = current_user
    if @event.valid?
      @event.save
      redirect_to event_index_path
    else
      flash[:errors] = @event.errors.full_messages
      event = @event
      render "index"
      flash[:errors]=[]
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete if current_user == @event.host
    redirect_to event_index_path
  end

  def update
    @event = Event.find(params[:id])
    @event.attributes = event_params
    if @event.save
      redirect_to event_index_path
    else
      @states = State.all
      flash[:errors] = @event.errors.full_messages
      render "show", layout: "two_cols"
      flash[:errors]=[]
    end
  end

  def show
    @event = Event.find(params[:id])
    @states = State.all
    @event_comments = @event.comments.order(created_at: :desc )
    render layout: "two_cols"
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :state, :event_date)
    end

end