Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
    email: "breault.patrick@gmail.com",
    password: "password",
    password_confirmation: "password"
  )
Rails.logger.info "User Email: #{user.email}"

# Rails.logger.info "==============================================="
# Rails.logger.info "Creating Playlists"
# Rails.logger.info "==============================================="
#
# playlist = Playlist.create!(name: "Pat's Playlist")
# Rails.logger.info "Playlist: #{playlist.name}"
