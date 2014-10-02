class SessionsController < ApplicationController
 
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user # means if user exists
  		cookies.permanent[:auth_token] = user.auth_token #used to track current user
  		flash[:success] = "You have logged in"
  		redirect_to root_url
  	else
  		flash.now.alert = "Log in failed!"
  		render 'new'
  	end
  end

  def destroy
  	cookies.delete :auth_token
    current_user = nil
  	flash[:success] = "You have Logged out!"
  	redirect_to root_path
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
