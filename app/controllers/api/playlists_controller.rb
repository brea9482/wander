module Api
  class PlaylistsController < BaseController

    def index
      @playlist = Playlist.all
      respond_to do |format|
        format.json { render json: @playlist }
      end
    end

  end
end
