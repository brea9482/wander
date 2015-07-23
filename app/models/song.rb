class Song < ActiveRecord::Base
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
  has_many :recommendation_songs
  has_many :playlists, through: :recommendation_songs

  validates :artist, presence: true
  validates :song_name, presence: true
  validates :genre, presence: true
  validates :soundcloud_url, allow_blank: true, :format => URI::regexp(%w(http https))
  validates :youtube_url, allow_blank: true, :format => URI::regexp(%w(http https www))

  validate :one_url

  def one_url
    if soundcloud_url.blank? && youtube_url.blank?
      errors.add(:base, "Please specify one URL in the proper format")
    elsif !soundcloud_url.blank? && !youtube_url.blank?
      errors.add(:base, "Please specify one URL in the proper format")
    end
  end

  GENRE = [
  'Alternative Rock',
  'Bluegress',
  'Blues',
  'Blues Rock',
  'Classical',
  'Classic Rock',
  'Country',
  'Dance',
  'Dubstep',
  'Electriconic',
  'Funk',
  'Hardcore',
  'Hop-Hop',
  'Indie Rock',
  'Instrumental',
  'Jam Band',
  'Jazz',
  'Lounge',
  'Metal',
  'Motown',
  'Pop',
  'Progressive Rock',
  'Psychedelic Rock',
  'Punk',
  'Soul',
  'Surf',
  'Reggae',
  'Rock',
  'Swing',
  'R&B',
  'Techno'
]
end
