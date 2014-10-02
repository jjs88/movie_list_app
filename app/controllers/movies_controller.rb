class MoviesController < ApplicationController

	def create
		@movie = Movie.new(movies_params)
		@movie.user_id = current_user.id
		@movie.save

        redirect_to root_path
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	 def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movies_params)
      # Handle a successful update.
      flash[:success] = "d"
      redirect_to root_url
    end
  end



	private 
	  def movies_params
	  	params.require(:movie).permit(:name, :tag_list)
	  end
end
