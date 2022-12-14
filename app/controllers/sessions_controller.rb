class SessionsController < ApplicationController
  def new
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   # If the user exists AND the password entered is correct
  #   if user && user.authenticate(params[:password])
  #     # Save the user id in the browser cookie
  #     session[:user_id] = user.id
  #     redirect_to '/'
  #   else
  #   # If user's login doesn't work, redirect to the login form
  #     redirect_to '/login'
  #   end
  # end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:alert] = "Invalid email and/or password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end