class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    unless current_user
      redirect_to root_path
    end
  end

  helper_method :current_user
  before_action :logged_in
end
