require 'rails_helper'

feature 'user creates a new song', %{
  As a user
  I want to sign in
  So that I can create a new song to add to my playlist
} do

  scenario 'user creates a new song' do
    playlist = FactoryGirl.create(:playlist)
    user = playlist.user

    sign_in(user)

    visit new_playlist_song_path(playlist)

    fill_in "Artist", with: "Tame Impala"
    fill_in "Song Name", with: "Elephant"
    fill_in "Genre", with: "Rock"

    click_on "Add this song!"

    expect(page).to have_content("Tame Impala")
    expect(page).to have_content("Song added to your playlist!")
  end

  scenario 'user creates an invalid playlist' do
    playlist = FactoryGirl.create(:playlist)
    user = playlist.user

    sign_in(user)

    visit new_playlist_song_path(playlist)

    fill_in "Artist", with: "Tame Impala"
    fill_in "Song Name", with: ""

    click_on "Add this song!"

    expect(page).to_not have_content("Tame Impala")
    expect(page).to have_content("Song name can't be blank")
  end

end
