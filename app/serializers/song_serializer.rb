class SongSerializer < ActiveModel::Serializer
  attributes :id, :artist, :song_name, :album, :genre
end
