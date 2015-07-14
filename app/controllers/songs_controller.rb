class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
        flash[:danger] = "OH SHIT"
        render :new
      end
    else
      flash[:danger] = 'Song not saved. See below for errors.'
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
    @playlist_songs = PlaylistSong.find_by(playlist_id: @playlist.id)
  end

  def update
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])

    if @song.update(song_params)
      @playlist_song = PlaylistSong.find_by(playlist_id: @playlist.id, song_id: @song.id)

      if @playlist_song.update(playlist_id: @playlist.id, song_id: @song.id)
        flash[:success] = 'Song successfully updated!'
        redirect_to @playlist
      else
        flash[:danger] = "OH SHIT"
        render :new
      end
    else
      flash[:danger] = 'Song not updated. See below for errors.'
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
    @playlist_song = PlaylistSong.find_by(playlist_id: @playlist.id, song_id: @song.id)

    @song.destroy
    @playlist_song.destroy
    flash[:success] = 'Song successfully deleted!'
    redirect_to playlist_path(@playlist)
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
