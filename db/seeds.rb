# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genres = ["Action", "Adventure", "Animation",	"Biography", "Comedy", "Crime", "Documentary", "Drama", "Family",	"Fantasy", "Game-Show", "History", "Horror", "Music",	"Musical", "Mystery", "News", "Reality-TV", "Romance", "Sci-Fi", "Sitcom", "Sport", "Talk-Show", "Thriller", "War", "Western"]
genres.map { |genre| Genre.create(name: genre) }

matrix = Movie.create(title: "The Matrix", storyline: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.", release_date: "1999-03-31", imdb_link: "http://www.imdb.com/title/tt0133093/")
memento = Movie.create(title: "Memento", storyline: " A man juggles searching for his wife's murderer and keeping his short-term memory loss from being an obstacle.", release_date: "2000-05-25", imdb_link: "http://www.imdb.com/title/tt0209144/")
dark_knight = Movie.create(title: "The Dark Knight", storyline: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.", release_date: "2008-07-18", imdb_link: "http://www.imdb.com/title/tt0468569/")

matrix.genres << Genre.find_by(name: "Action")
matrix.genres << Genre.find_by(name: "Sci-Fi")
memento.genres << Genre.find_by(name: "Mystery")
memento.genres << Genre.find_by(name: "Thriller")
dark_knight.genres << Genre.find_by(name: "Action")
dark_knight.genres << Genre.find_by(name: "Crime")
dark_knight.genres << Genre.find_by(name: "Drama")
dark_knight.genres << Genre.find_by(name: "Thriller")
