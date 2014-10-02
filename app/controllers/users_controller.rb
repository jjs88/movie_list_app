class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(users_params)
  	@user.save
  	redirect_to root_path
  end

  def index
  	@users = User.all
  end

  def show
    @user = User.find(current_user)
    @movie = Movie.new
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end

    private
      def users_params
      	params.require(:user).permit(:email, :username, :password, :password_confirmation)
      end


end
