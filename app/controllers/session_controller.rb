class SessionController < ApplicationController
  skip_before_action :logged_in, only: [:index, :create]
  def index
    # loads the login page
  end

  def create
    @user = User.find_by_email(params[:login]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      session[:name] = @user.name
      # redirect_to user_show_path(:id => @user.id), notice: "#{@user.name} successfully logged in."
      redirect_to event_index_path, notice: "#{@user.name} successfully logged in."
    else
      flash[:errors] = ['login/password not valid']
      render event_index_path
      flash[:errors] = []
    end
  end

  def destroy
    if session[:user_id] != nil
      flash[:notice] = "#{session[:name]} successfully logged out."
      session[:user_id] = nil
      session[:name] = nil
      redirect_to root
    end
  end
end
