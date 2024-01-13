class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    # Dillion recommends the following because it adds the bookmark and automatically sets the ID
    @bookmark = @list.bookmarks.new(bookmark_params)
    # @bookmark = Bookmark.new(bookmark_params)
    # @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to @list
    else
      render :new, status: 422
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
