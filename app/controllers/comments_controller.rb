class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    @playlist = Playlist.find(params[:playlist_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.playlist_id = @playlist.id
    if @comment.save
      flash[:success] = "Comment created successfully!"
      redirect_to playlist_path(@playlist)
    else
      flash[:danger] = 'Comment not created. See below for errors.'
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:playlist_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @playlist = Playlist.find(params[:playlist_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = "Comment changed successfully!"
      redirect_to playlist_path(@playlist)
    else
      flash[:danger] = 'Comment not changed. See below for errors.'
      render :new
    end
  end

  def destroy
    @playlist = Playlist.find(params[:playlist_id])
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:success] = "Comment deleted successfully."
    else
      flash.now[:danger] = "Comment not deleted."
    end
    redirect_to playlist_path(@playlist)
  end

  protected

  def comment_params
    params.require(:comment).permit(:title, :description)
  end
end
