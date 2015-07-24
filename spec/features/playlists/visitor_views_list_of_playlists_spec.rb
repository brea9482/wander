require 'rails_helper'

feature 'vistor views a list of playlists', %{
  As a visitor
  I want to sign in view a list of playlists
} do

  scenario 'visitor views a list of playlist' do
    playlist = FactoryGirl.create(:playlist)

    visit playlists_path

    expect(page).to have_content(playlist.name)
    expect(page).to have_content(playlist.description)
  end
end
