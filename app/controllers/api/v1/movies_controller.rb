class Api::V1::MoviesController < ApplicationController

  def index
    movies = Movie.all.map { |movie|
      genre_names = movie.genres.map { |genre| genre.name }
      {
        id: movie.id,
        title: movie.title,
        storyline: movie.storyline,
        release_date: movie.release_date,
        imdb_link: movie.imdb_link,
        genres: genre_names
      }
    }
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
      render json: 'Movie created!'
    else
      render json: (movie.errors.full_messages)
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

  private

  def movie_params
    params.require(:movie).permit(:title, :storyline, :release_date, :imdb_link)
  end

end
