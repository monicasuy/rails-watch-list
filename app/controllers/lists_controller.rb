class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy] # runs the set_list method in order to find the specific list before
  # the methods that need it, in this case show and destroy

  # the index method shows all the lists
  def index
    @lists = List.all
  end

  # the show method will run the set_list method and find a specific list
  def show; end

  # the new method renders a page where the user can input the information for a new list
  def new
    @list = List.new
  end

  # the create method actually creates the list from the information put in the new method by the user
  # and then redirects the user to the list created (unless the list couldn't be created (i.e. in the case of missing information
  # in which case the user is redirected to the new method page again)
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  # the destroy method deletes a list and then redirects the user back to the lists page (index) which in this case is
  # the root page as well
  def destroy
    if @list.destroy
      redirect_to root_path
    end
  end

  private

  # private method that finds a specific list and is run before show and destroy
  def set_list
    @list = List.find(params[:id])
  end

  # private method for the list information that is accessible
  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
