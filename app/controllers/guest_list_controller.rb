class GuestListController < ApplicationController
  def create
    @guest_list = GuestList.new
    @event = Event.find(params[:event_id].to_i)
    @guest_list.event = @event
    @guest_list.user = current_user

    if @guest_list.save
      redirect_to event_index_path(id: @event.id)
    else
      flash[:errors] = @guest_list.errors.full_messages
      render event_index_path(id: :event_id)
      flash[:errors] = []
    end
  end

  def destroy
    @guest_list = GuestList.find(params[:id].to_i)
    @guest_list.delete
    redirect_to event_index_path(id: @guest_list.event.id)
  end
end
