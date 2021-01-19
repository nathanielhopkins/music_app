class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      render json: "Welcome to the site, #{@user.email}"
    else
      render json: @user.errors.full_messages
    end
  end

  def show
    if current_user.nil?
      redirect_to new_session_url 
    elsif current_user.id != params[:id].to_i
      redirect_to user_url(current_user)
    else
      render :show
    end
  end
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end