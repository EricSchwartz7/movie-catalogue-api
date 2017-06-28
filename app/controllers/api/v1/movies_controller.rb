class Api::V1::MoviesController < ApplicationController

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      params[:genres].map { |genre|
        movie.genres << Genre.find_by(name: genre)
      }
      render json: movie
    else
      render json: "error"
    end
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(movie_params)
      movie.genres.clear
      params[:genres].map { |genre|
        movie.genres << Genre.find_by(name: genre)
      }
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :storyline, :release_date, :imdb_link)
  end

end
