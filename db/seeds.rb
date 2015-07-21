Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
    email: "breault.patrick@gmail.com",
    password: "password",
    password_confirmation: "password"
  )

user2 = User.create!(
    email: "test@test.com",
    password: "password",
    password_confirmation: "password"
  )

user3 = User.create!(
    email: "testtest@test.com",
    password: "password",
    password_confirmation: "password"
  )

Rails.logger.info "==============================================="
Rails.logger.info "Creating Playlists"
Rails.logger.info "==============================================="

# Playlist 1

playlist = Playlist.create!(
  name: "Old school 90's alternative rock",
  description: "Really love Weezer and the Offspring form those days",
  user_id: user.id
)

song = Song.create!(
  artist: "Weezer",
  song_name: "Say it ain't so",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=ENXvZ9YRjbo"
)

PlaylistSong.create!(
song_id: song.id,
playlist_id: playlist.id
)

song1 = Song.create!(
  artist: "The Offspring",
  song_name: "Self Esteem",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=Abrn8aVQ76Q"
)

PlaylistSong.create!(
song_id: song1.id,
playlist_id: playlist.id
)

song2 = Song.create!(
  artist: "Harvey Danger",
  song_name: "Flagpole Sitta",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=nBgmC_USeoM"
)

PlaylistSong.create!(
song_id: song2.id,
playlist_id: playlist.id
)

song3 = Song.create!(
  artist: "Green Day",
  song_name: "Welcome to Paradise",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=p9Y-r-rs9W8"
)

PlaylistSong.create!(
song_id: song3.id,
playlist_id: playlist.id
)

# Playlist 2

playlist2 = Playlist.create!(
  name: "New Age Psych Rock!!",
  description: "Anything with crunchy fuzzed out guitars and reverb",
  user_id: user2.id
)

song4 = Song.create!(
  artist: "Tame Impala",
  song_name: "Feels like we only go backwards",
  genre: "Psychedelic Rock",
  soundcloud_url: "https://soundcloud.com/tame-impala/feels-like-we-only-go"
)

PlaylistSong.create!(
song_id: song4.id,
playlist_id: playlist2.id
)

song5 = Song.create!(
  artist: "Mac Demarco",
  song_name: "Ode to Victory",
  genre: "Surf",
  soundcloud_url: "https://soundcloud.com/capturedtracks/mac-demarco-ode-to-viceroy"
)

PlaylistSong.create!(
song_id: song5.id,
playlist_id: playlist2.id
)

song6 = Song.create!(
  artist: "Temples",
  song_name: "Shelter Song",
  genre: "Psychedelic Rock",
  soundcloud_url: "https://soundcloud.com/templesofficial/shelter-song"
)

PlaylistSong.create!(
song_id: song6.id,
playlist_id: playlist2.id
)

song7 = Song.create!(
  artist: "Allah-Las",
  song_name: "Catamaran",
  genre: "Surf",
  soundcloud_url: "https://soundcloud.com/allahlas/catamaran"
)

PlaylistSong.create!(
song_id: song7.id,
playlist_id: playlist2.id
)

# Playlist 3

playlist3 = Playlist.create!(
  name: "Pat's music 2015",
  description: "Just a list of some really cool songs I've heard lately",
  user_id: user3.id
)

# Playlist 4

playlist4 = Playlist.create!(
  name: "Led Zepp inspired playlist",
  description: "Really love those 70's rock groups!",
  user_id: user3.id
)

# Playlist 4

playlist5 = Playlist.create!(
  name: "Funk Jazzzzzzzzzz",
  description: "Give me that funk jazz!!!!",
  user_id: user3.id
)
