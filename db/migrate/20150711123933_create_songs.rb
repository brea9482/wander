class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist, null: false
      t.string :song_name, null: false
      t.string :album
      t.string :genre, null: false
      t.string :soundcloud_url
      t.string :youtube_url


      t.timestamps null: false
    end
  end
end
