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
      flash[:alert] = 'Playlist not created. See below for errors.'
      render :new
    end
  end

  def index
    if params[:search].present?
      @playlists = Playlist.search(params[:search]).page(params[:page]).per(10)
    elsif params[:id].present?
      @playlists = Playlist.where(user_id: params[:id]).page(params[:page]).per(10)
    else
      @playlists = Playlist.all.page(params[:page]).per(10)
    end
  end

  def show
    @playlist = Playlist.find(params[:id])
    @playlist_songs = PlaylistSong.find_by(playlist_id: @playlist.id)
    @recommendation_songs = RecommendationSong.find_by(playlist_id: @playlist.id)
    @comments = Comment.where(playlist_id: params[:id])
    @comment = Comment.new

    unless @playlist_songs.nil?
      @songs = Song.joins(:playlist_songs).where(playlist_songs: { playlist_id: @playlist_songs.playlist_id } )
    end

    unless @recommendation_songs.nil?
      @song_recommendations = Song.joins(:recommendation_songs).where(recommendation_songs: { playlist_id: @recommendation_songs.playlist_id } )
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
      flash[:alert] = "Playlist not updated. See below for errors."
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    if @playlist.destroy
      flash[:success] = "Playlist deleted successfully."
    else
      flash.now[:alert] = "Playlist not deleted."
    end
    redirect_to playlists_path
  end

  protected

  def playlist_params
    params.require(:playlist).permit(:name, :description)
  end
end
