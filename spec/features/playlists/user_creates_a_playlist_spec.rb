require 'rails_helper'

feature 'user creates a new playlist', %{
  As a user
  I want to sign in
  So that I can create a new playlist
} do

  scenario 'user creates a playlist' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit new_playlist_path

    fill_in "Name", with: "New Playlist"

    click_on "Submit new playlist!"

    expect(page).to have_content("Playlist created successfully!")
    expect(page).to have_content("New Playlist")
  end

  scenario 'user creates an invalid playlist' do
    user = FactoryGirl.create(:user)
    sign_in(user)

    visit new_playlist_path

    fill_in "Name", with: ""

    click_on "Submit new playlist!"

    expect(page).to have_content("Error")
  end

end
