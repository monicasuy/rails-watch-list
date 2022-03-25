class BookmarksController < ApplicationController

  # the new method renders a page where the user can input the information for a new bookmark
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # the create method actually creates the bookmark from the information put in the new method by the user
  # and then redirects the user to the list where the bookmark created (unless the bookmark couldn't be created
  # (i.e. in the case of missing information in which case the user is redirected to the new method page again)
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end

  # the destroy method deletes a bookmark and then redirects the user back to the list the bookmark used to be in
  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      redirect_to list_path(@bookmark.list_id)
    end
  end

  private

  # private method for the bookmark information that is accessible
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
