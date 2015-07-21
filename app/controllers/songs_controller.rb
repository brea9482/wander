class SongsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # define new methods for song recommendations or integrate into current methods with logic?

  def new
    @playlist = Playlist.find(params[:playlist_id])
      if @playlist.user_id == current_user.id
        @playlist_song = PlaylistSong.new
      else
        @recommendation_song = RecommendationSong.new
      end
    @song = Song.new
  end

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.new(song_params)

    if @playlist.user_id == current_user.id
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
    else
      if @song.save
        @recommendation_song = RecommendationSong.new(
          playlist_id: @playlist.id,
          song_id: @song.id,
          recommendee_id: @playlist.user_id,
          recommender_id: current_user.id
        )

        if @recommendation_song.save
          flash[:success] = 'Song added to this playlist!'
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
  end

  def edit
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])
    if @playlist.user_id == current_user.id
      @playlist_songs = PlaylistSong.find_by(playlist_id: @playlist.id, song_id: @song.id)
    else
      @recommendation_song = RecommendationSong.find_by(
        playlist_id: @playlist.id,
        song_id: @song.id,
        recommendee_id: @playlist.user_id,
        recommender_id: current_user.id
      )
    end
  end

  def update
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])

    if @playlist.user_id == current_user.id
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
    else
      if @song.update(song_params)
        @recommendation_song = RecommendationSong.find_by(
          playlist_id: @playlist.id,
          song_id: @song.id,
          recommendee_id: @playlist.user_id,
          recommender_id: current_user.id
        )

        if @recommendation_song.update(
          playlist_id: @playlist.id,
          song_id: @song.id,
          recommendee_id: @playlist.user_id,
          recommender_id: current_user.id
        )
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
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @song = Song.find(params[:id])

    if @playlist.user_id == current_user.id
      @playlist_song = PlaylistSong.find_by(playlist_id: @playlist.id, song_id: @song.id)
      @song.destroy
      @playlist_song.destroy
      flash[:success] = 'Song successfully deleted!'
      redirect_to playlist_path(@playlist)
    else
      @recommendation_song = RecommendationSong.find_by(
        playlist_id: @playlist.id,
        song_id: @song.id,
        recommendee_id: @playlist.user_id,
        recommender_id: current_user.id
      )
      @song.destroy
      @recommendation_song.destroy
      flash[:success] = 'Song successfully deleted!'
      redirect_to playlist_path(@playlist)
    end
  end

  protected

  def song_params
    params.require(:song).permit(
      :artist,
      :song_name,
      :album,
      :genre,
      :soundcloud_url,
      :youtube_url
    )
  end
end
