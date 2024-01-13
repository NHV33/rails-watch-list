class ListsController < ApplicationController

  before_action :set_list, only: %i[show]

  def index
    @lists = List.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: 422
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    #Using .includes loads the DB into memory to reduce total DB queries
    @list = List.includes(:movies).find(params[:id])
  end
end
