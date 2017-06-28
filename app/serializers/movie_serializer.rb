class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :storyline, :release_date, :imdb_link, :genres

  def genres
    object.genres.map { |genre| genre.name }
  end

end
