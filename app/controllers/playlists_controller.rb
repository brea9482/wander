class PlaylistsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    if @playlist.save
      flash[:success] = "Playlist created successfully!"
      redirect_to @playlist
    else
      flash[:danger] = 'Playlist not created. See below for errors.'
      render :new
    end
  end

  def index
    if params[:search].present?
      @playlists = Playlist.search(params[:search])
    elsif params[:id].present?
      @playlists = Playlist.where(user_id: params[:id])
    else
      @playlists = Playlist.all
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = PlaylistSong.find_by(playlist_id: @playlist.id)

    unless @playlist_songs.nil?
      # @songs = PlaylistSong.joins(:song).where(playlist_id: @playlist_songs.playlist_id)
      # @songs = Song.where(id: @playlist_songs.song_id)
      @songs = Song.joins(:playlist_songs).where(playlist_songs: { playlist_id: @playlist_songs.playlist_id } )

    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:id])

    if @playlist.update(playlist_params)
      flash[:success] = "Playlist updated successfully!"
      redirect_to @playlist
    else
      flash[:danger] = "Playlist not updated. See below for errors."
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy
    redirect_to playlists_path
  end

  protected

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end