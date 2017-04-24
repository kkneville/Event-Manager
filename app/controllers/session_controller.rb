class SessionController < ApplicationController
  skip_before_action :logged_in, only: [:index, :create]
  def index
    # loads the login page
    if current_user
      redirect_to event_index_path
    end
  end

  def create
    @user = User.find_by_email(params[:login].downcase!).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      session[:name] = @user.name
      session[:event] = nil
      session[:user] = nil
      redirect_to event_index_path, notice: "#{@user.name} successfully logged in."
    else
      flash[:errors] = ['login/password not valid']
      redirect_to root_path
    end
  end

  def destroy
    if session[:user_id] != nil
      flash[:notice] = "#{session[:name]} successfully logged out."
      session[:user_id] = nil
      session[:name] = nil
      session[:event] = nil
      session[:user] = nil
      redirect_to root_path
    end
  end
end
