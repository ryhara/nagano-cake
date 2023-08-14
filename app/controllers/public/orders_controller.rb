class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  before_action :check_cart, only: [:new, :confirm, :create, :complete]
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800;
    @order.billing_amount = @order.calc_total_price(current_customer) + @order.shipping_fee
    if params[:order][:address_select] == "0"
      @order.shipping_receiver_name = current_customer.last_name + current_customer.first_name
      @order.shipping_post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
    elsif params[:order][:address_select] == "1"
      @order.shipping_receiver_name = Address.find(params[:order][:address_id]).receiver_name
      @order.shipping_post_code = Address.find(params[:order][:address_id]).post_code
      @order.shipping_address = Address.find(params[:order][:address_id]).address
    elsif params[:order][:address_select] == "2"
      @order.shipping_receiver_name = params[:order][:shipping_receiver_name]
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
    end
  end

  def complete
    current_customer.cart_items.destroy_all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.taxed_price = cart_item.item.with_tax_price
        @order_item.item_count = cart_item.amount
        @order_item.save
      end
      redirect_to orders_complete_path
    else
      @order = Order.new
      render new
    end
  end

  def index
    @orders = current_customer.orders
  end

  def show
    if params[:id] == "confirm"
      redirect_to cart_items_path
    else
      @order = Order.find(params[:id])
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :billing_amount, :shipping_fee, :shipping_post_code, :shipping_address, :shipping_receiver_name ,:oreder_status)
  end
  
  def check_cart
    @cart_items = current_customer.cart_items
    if @cart_items.empty?
      redirect_to cart_items_path
    end
  end

end
