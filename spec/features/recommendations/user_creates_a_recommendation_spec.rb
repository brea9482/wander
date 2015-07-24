require 'rails_helper'

feature 'user creates a new recommendation', %{
  As a user
  I want to sign in and view a playlist
  So that I can create a new recommendation
} do

  scenario 'user creates a new recommendation' do
    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist)

    sign_in(user)

    visit playlist_path(playlist)

    click_on "Make a recommendation for this playlist!"

    fill_in "Artist", with: "Tame Impala"
    fill_in "Song Name", with: "Elephant"
    select "Rock", from: "Genre"
    fill_in "SoundCloud URL", with: "http://soundcloud.com/tame-impala/feels-like-we-only-go"

    click_on "Add this song!"

    expect(page).to have_content("Tame Impala")
    expect(page).to have_content("Song added")
  end

  scenario 'user creates an invalid recommendation' do
    user = FactoryGirl.create(:user)
    playlist = FactoryGirl.create(:playlist)

    sign_in(user)

    visit playlist_path(playlist)

    click_on "Make a recommendation for this playlist!"

    fill_in "Artist", with: "Tame Impala"
    fill_in "Song Name", with: ""
    select "Rock", from: "Genre"
    fill_in "SoundCloud URL", with: "http://soundcloud.com/tame-impala/feels-like-we-only-go"

    click_on "Add this song!"

    expect(page).to_not have_content("Tame Impala")
    expect(page).to have_content("Song name can't be blank")
  end

end
