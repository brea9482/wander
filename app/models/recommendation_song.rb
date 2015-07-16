class RecommendationSong < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :song
  belongs_to :user

  validates :playlist_id, presence: true
  validates :song_id, presence: true
  validates :recommender_id, presence: true
  validates :recommendee_id, presence: true
end
