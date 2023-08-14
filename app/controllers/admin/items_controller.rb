class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:search]
      @items = Item.where('name LIKE ?', "%#{params[:search]}%")
    else
      @items = Item.all
    end
  end
  
  def new
    @genres = Genre.all
    @item = Item.new
  end
  
  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render "new"
    end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :non_taxed_price, :is_selling, :image)
  end
end
