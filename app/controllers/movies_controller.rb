class MoviesController < ApplicationController
    require 'uri'

    def index
        @movies = Movie.all 
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def create
        @movie = Movie.new(movie_params)

        hash = ImdbService.new 
        escaped_title = URI.escape(@movie.title)
        @movie.plot = hash.get_plot_by_title(escaped_title)

        if @movie.save 
            redirect_to @movie
        else 
            render "new"
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :release_date, :plot)
    end

end
