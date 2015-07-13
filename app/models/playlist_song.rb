class PlaylistSong < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song

  validates :playlist_id, presence: true
  validates :song_id, presence: true
end
