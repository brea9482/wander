class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index :comments, :playlist_id
    add_index :playlists, :user_id
    add_index :playlist_songs, :playlist_id
    add_index :playlist_songs, :song_id
    add_index :recommendation_songs, :song_id
    add_index :recommendation_songs, :playlist_id
  end
end
