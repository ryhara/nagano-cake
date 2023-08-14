class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end
  
  # amount max 10
  def create
    @cart_item = CartItem.new(cart_item_params)
    @before_cart_item = CartItem.all.find_by(item_id: @cart_item.item_id)
    if @before_cart_item
        sum =  @before_cart_item.amount + @cart_item.amount
        if (sum > 10)
          sum = 10
        end
        @before_cart_item.update_attribute(:amount, sum)
        @cart_item.delete
        redirect_to cart_items_path
    else
      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to referer
      end
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items
      @total = 0
      render cart_items_path
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
