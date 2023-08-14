class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :check_status, only: [:show]
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    if order.order_status == "confirming"
      order.order_items.each do |order_item|
        order_item.update(making_status: "waiting")
      end
    end
    redirect_to admin_order_path(order)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :billing_amount, :shipping_fee, :shipping_post_code, :shipping_address, :shipping_receiver_name ,:order_status)
  end
  
  def check_status
    order = Order.find(params[:id])
    flag = 0
    order.order_items.each do |order_item|
      if order_item.making_status != "complete"
        if order_item.making_status == "making"
          order.update(order_status: "making")
        end
        flag = 1
      end
      if (flag == 1)
        break ;
      end
    end
    if flag == 0
      order.update(order_status: "preparing")
      
    end
  end
end
