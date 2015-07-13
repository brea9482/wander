class Song < ActiveRecord::Base
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  validates :artist, presence: true
  validates :song_name, presence: true
  validates :genre, presence: true
end
