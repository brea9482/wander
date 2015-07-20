class CreateRecommendationSongs < ActiveRecord::Migration
  def change
    create_table :recommendation_songs do |t|
      t.integer :song_id, null: false
      t.integer :playlist_id, null: false
      t.integer :recommender_id, null: false
      t.integer :recommendee_id, null: false

      t.timestamps null: false
    end
  end
end
