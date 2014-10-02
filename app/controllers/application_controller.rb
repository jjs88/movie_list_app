class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    helper_method :current_user


  private 

  	def current_user
  		@current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  	end

  	def signed_in?
     !current_user.nil?
    end

     def signed_in_user
      unless signed_in?
        flash[:notice] = "Please sign in."
        redirect_to root_url
      end
    end
end
