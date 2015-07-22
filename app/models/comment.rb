class Comment < ActiveRecord::Base
  belongs_to :playlist
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :playlist_id, presence: true
end
