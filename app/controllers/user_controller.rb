class UserController < ApplicationController
  :has_secure_password
  skip_before_action :logged_in, only: [:new, :create]

  def index
  end

  def create
    @states = State.all
    @user = User.new( user_params )
    @user.valid?
    if (@user.password == @user.password_confirmation)
      # user.password_confirmation = nil
      if @user.save
        session[:user] = nil
        redirect_to '/'
      else
        flash[:errors] = @user.errors.full_messages
        session[:user] = @user
        # user = @user
        # render "new"
        # flash[:errors]=[]
        redirect_to user_new_path
      end
    else
      flash[:errors] = @user.errors.full_messages
      flash[:errors].append("Passwords and Confirm Password don't match")
      session[:user] = @user
      # user = @user
      # render "new"
      # flash[:errors]=[]
      redirect_to user_new_path
    end
  end

  def show
    @states = State.all
    @user = User.find(params[:id])
    @user = User.new(session[:user]) if flash[:errors] != nil && session[:user] != nil
    render layout: 'two_cols'
  end

  def destroy
  end

  def new
    @states = State.all
    @user = User.new
    @user = User.new(session[:user]) if flash[:errors] != nil && session[:user] != nil

  end

  def update
    @user = User.find(params[:id])
    @user.attributes = profile_params
    if @user.save( context: :skip_pw )
      redirect_to event_index_path
    else
      @states = State.all
      flash[:errors] = @user.errors.full_messages
      session[:user] = @user
      redirect_to user_show_path(params[:id])
      # render "show", layout: "two_cols"
      # flash[:errors]=[]
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :state, :password, :password_confirmation, :email)
  end
  def profile_params
    params.require(:user).permit(:first_name, :last_name, :location, :state, :email)
  end
end
