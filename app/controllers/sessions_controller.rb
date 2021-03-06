class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Incorrect email and/or password"]
      render :new
    else
      login_user!(user)
      flash[:notices] = "Successfully logged in as: #{user.email}"
      redirect_to bands_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    flash[:notices] = "Successfully logged out"

    redirect_to new_session_url
  end
end