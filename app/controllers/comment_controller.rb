class CommentController < ApplicationController
  def create
    @comment = Comment.new
    puts "~=~=~=~=~=~=~=~=#{params[:comment]}"
    @comment.text = params[:comment][:text]
    @event = Event.find(params[:event_id].to_i)
    @comment.event = @event
    @comment.user = current_user

    if @comment.save
      redirect_to event_show_path(id: @event.id)
    else
      flash[:errors] = @comment.errors.full_messages
      render event_show_path(id: :event_id)
      flash[:errors] = []
    end
  end

  def destroy
    @comment = Comment.find(params[:id].to_i)
    @comment.delete
    redirect_to event_show_path(id: @comment.event.id)
  end

  def new
  end
end
