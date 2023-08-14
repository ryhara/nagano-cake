class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def index
    if params[:search]
      @items = Item.where('name LIKE ?', "%#{params[:search]}%")
      @genres = Genre.all
    elsif params[:genre]
      @items = Item.where(genre_id: params[:genre])
      @genres = Genre.all
    else
      @items = Item.all
      @genres = Genre.all
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
