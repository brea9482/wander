require 'rails_helper'

feature 'user creates a new comment', %{
  As a user
  I want to sign in and view a playlist
  So that I can create a new comment
} do

  scenario 'user creates a new comment' do
    playlist = FactoryGirl.create(:playlist)
    user = playlist.user

    sign_in(user)

    visit playlist_path(playlist)

    fill_in "Comment Name", with: "title"
    fill_in "Comment Description", with: "description"

    click_on "Submit Comment"

    expect(page).to have_content("title")
    expect(page).to have_content("Comment created")
  end

  scenario 'user creates an invalid comment' do
    playlist = FactoryGirl.create(:playlist)
    user = playlist.user

    sign_in(user)

    visit playlist_path(playlist)

    fill_in "Comment Name", with: ""
    fill_in "Comment Description", with: ""

    click_on "Submit Comment"

    expect(page).to_not have_content("Title")
    expect(page).to have_content("Comment not created")
  end

end
