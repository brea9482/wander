class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
