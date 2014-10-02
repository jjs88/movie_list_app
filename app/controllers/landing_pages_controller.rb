class LandingPagesController < ApplicationController
  
  def home
  	@movie = Movie.new
  	@movies = current_user.movies if signed_in?
  	@tags = current_user.tags if signed_in?
  end
end
