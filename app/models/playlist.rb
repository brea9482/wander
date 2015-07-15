class Playlist < ActiveRecord::Base
  belongs_to :user

  has_many :playlist_songs
  has_many :songs, through: :playlist_songs

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  include PgSearch
  pg_search_scope :search,
    :against => [:name, :description],
    :using => {
      :tsearch => {:prefix => true}
    },
    :associated_against => {
      :songs => [:artist, :genre, :album, :song_name]
    }
end
