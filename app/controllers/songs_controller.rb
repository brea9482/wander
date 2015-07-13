class SongsController < ApplicationController
  def new
    @playlist = Playlist.find(params[:playlist_id])
    @playlist_song = PlaylistSong.new
    @song = Song.new
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.new(song_params)

    if @song.save
      @playlist_song = PlaylistSong.new(playlist_id: @playlist.id, song_id: @song.id)

      if @playlist_song.save
        flash[:success] = 'Song added to your playlist!'
        redirect_to @playlist
      else
        binding.pry
        flash[:danger] = "OH SHIT"
        render :new
      end
    else
      flash[:danger] = 'Song not saved. See below for errors.'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def song_params
    params.require(:song).permit(
      :artist,
      :song_name,
      :album,
      :genre
    )
  end
end
