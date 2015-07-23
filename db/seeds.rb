Rails.logger.info "==============================================="
Rails.logger.info "Creating Users"
Rails.logger.info "==============================================="

user = User.create!(
    email: "breault.patrick@gmail.com",
    username: "braaaa",
    password: "password",
    password_confirmation: "password"
  )

user2 = User.create!(
    email: "test@test.com",
    username: "musiclover",
    password: "password",
    password_confirmation: "password"
  )

user3 = User.create!(
    email: "testtest@test.com",
    username: "crazycali",
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

song30 = Song.create!(
  artist: "The Presidents of the Unites States of America",
  song_name: "Lump",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=_sj_U6vObUA"
)

RecommendationSong.create!(
song_id: song30.id,
playlist_id: playlist.id,
recommender_id: user2.id,
recommendee_id: user.id
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
  soundcloud_url: "http://soundcloud.com/tame-impala/feels-like-we-only-go"
)

PlaylistSong.create!(
song_id: song4.id,
playlist_id: playlist2.id
)

song5 = Song.create!(
  artist: "Mac Demarco",
  song_name: "Ode to Victory",
  genre: "Surf",
  soundcloud_url: "http://soundcloud.com/capturedtracks/mac-demarco-ode-to-viceroy"
)

PlaylistSong.create!(
song_id: song5.id,
playlist_id: playlist2.id
)

song6 = Song.create!(
  artist: "Temples",
  song_name: "Shelter Song",
  genre: "Psychedelic Rock",
  soundcloud_url: "http://soundcloud.com/templesofficial/shelter-song"
)

PlaylistSong.create!(
song_id: song6.id,
playlist_id: playlist2.id
)

song7 = Song.create!(
  artist: "Allah-Las",
  song_name: "Catamaran",
  genre: "Surf",
  youtube_url: "https://www.youtube.com/watch?v=yIJ-RsIO1eA"
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

song80 = Song.create!(
  artist: "Foster the People",
  song_name: "Pseudologia Fantastica",
  genre: "Psychedelic Rock",
  youtube_url: "https://www.youtube.com/watch?v=5-mTcFGiVzw"
)

PlaylistSong.create!(
song_id: song80.id,
playlist_id: playlist3.id
)

song8 = Song.create!(
  artist: "Ratatat",
  song_name: "Cream on Chrome",
  genre: "Electriconic",
  youtube_url: "https://www.youtube.com/watch?v=xlcywgEMuGI"
)

PlaylistSong.create!(
song_id: song8.id,
playlist_id: playlist3.id
)

song9 = Song.create!(
  artist: "Tame Impala",
  song_name: "Let it Happen",
  genre: "Psychedelic Rock",
  youtube_url: "https://www.youtube.com/watch?v=-ed6UeDp1ek"
)

PlaylistSong.create!(
song_id: song9.id,
playlist_id: playlist3.id
)

song10 = Song.create!(
  artist: "Lower Dens",
  song_name: "Brains",
  genre: "Indie Rock",
  youtube_url: "https://www.youtube.com/watch?v=OyxzjF8IjE8"
)

PlaylistSong.create!(
song_id: song10.id,
playlist_id: playlist3.id
)

# Playlist 4

playlist4 = Playlist.create!(
  name: "Led Zepp inspired playlist",
  description: "Really love those 70's rock groups!",
  user_id: user3.id
)

song11 = Song.create!(
  artist: "Led Zeppelin",
  song_name: "Dazed and Confused",
  genre: "Classic Rock",
  youtube_url: "https://www.youtube.com/watch?v=ehwSEVbBZl4"
)

PlaylistSong.create!(
song_id: song11.id,
playlist_id: playlist4.id
)

song12 = Song.create!(
  artist: "Led Zeppelin",
  song_name: "Immigrant Song",
  genre: "Classic Rock",
  youtube_url: "https://www.youtube.com/watch?v=kEGuHdKn0Lc"
)

PlaylistSong.create!(
song_id: song12.id,
playlist_id: playlist4.id
)

song13 = Song.create!(
  artist: "Led Zeppelin",
  song_name: "Immigrant Song",
  genre: "Classic Rock",
  youtube_url: "https://www.youtube.com/watch?v=kEGuHdKn0Lc"
)

PlaylistSong.create!(
song_id: song13.id,
playlist_id: playlist4.id
)

song14 = Song.create!(
  artist: "Rolling Stones",
  song_name: "Jumpin Jack Flash",
  genre: "Classic Rock",
  youtube_url: "https://www.youtube.com/watch?v=eQSGw0hMd_I"
)

PlaylistSong.create!(
song_id: song14.id,
playlist_id: playlist4.id
)

# Playlist 4

playlist5 = Playlist.create!(
  name: "Funk Jazzzzzzzzzz",
  description: "Give me that funk jazz!!!!",
  user_id: user3.id
)

song15 = Song.create!(
  artist: "The Meters",
  song_name: "Funky Miracle",
  genre: "Funk",
  youtube_url: "https://www.youtube.com/watch?v=1jrmtmQIc9k"
)

PlaylistSong.create!(
song_id: song15.id,
playlist_id: playlist5.id
)

song16 = Song.create!(
  artist: "Daft Punk",
  song_name: "Da Funk",
  genre: "Electronic",
  youtube_url: "https://www.youtube.com/watch?v=n1ZqN_VFhdo"
)

PlaylistSong.create!(
song_id: song16.id,
playlist_id: playlist5.id
)

song17 = Song.create!(
  artist: "James Brown",
  song_name: "I got to move",
  genre: "Funk",
  youtube_url: "https://www.youtube.com/watch?v=aVpAMK7Z600"
)

PlaylistSong.create!(
song_id: song17.id,
playlist_id: playlist5.id
)

song18 = Song.create!(
  artist: "Jamiroquai",
  song_name: "Virtual Insanity",
  genre: "Funk",
  youtube_url: "https://www.youtube.com/watch?v=Et9b7LWfnxQ"
)

RecommendationSong.create!(
song_id: song18.id,
playlist_id: playlist5.id,
recommender_id: user.id,
recommendee_id: user3.id
)
