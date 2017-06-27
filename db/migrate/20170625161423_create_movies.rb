class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :storyline
      t.date :release_date
      t.string :imdb_link

      t.timestamps
    end
  end
end
