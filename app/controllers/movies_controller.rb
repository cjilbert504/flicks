class MoviesController < ApplicationController
	before_action :set_movie, only: [:show, :edit, :update, :destroy]
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		@movies = Movie.released
	end

	def show
		@fans = @movie.fans
	end

	def new
		@movie = Movie.new
	end

	def edit
	end

	def update
		if @movie.update(movie_params)
			redirect_to @movie, notice: "Movie successfully updated!"
		else
			render :edit
		end
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to @movie, notice: "Movie successfully created!"
		else
			render :new
		end
	end

	def destroy
		@movie.destroy
		redirect_to movies_url, alert: "Movie successfully deleted!"
	end


	private

	def movie_params
		params.require(:movie).permit(:title, :rating, :total_gross, :description, :released_on, :cast, :director, :duration, :image_file_name)
	end

	def set_movie
		@movie = Movie.find(params[:id])
	end
end
