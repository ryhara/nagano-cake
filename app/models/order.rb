class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  validates :customer_id, presence: true
  validates :payment_method, presence: true
  validates :billing_amount, presence: true
  validates :shipping_fee, presence: true
  validates :shipping_receiver_name, presence: true
  validates :shipping_post_code, presence: true
  validates :shipping_address, presence: true
  validates :order_status, presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: {waiting: 0, confirming: 1, making: 2, preparing: 3, shipping: 4}
  
  def calc_total_price(customer)
    total_price = 0
    customer.cart_items.each do |cart_item|
      total_price += cart_item.subtotal
    end
    return (total_price)
  end
  
  def full_address
    "〒" + self.shipping_post_code + " " + self.shipping_address + " " + self.shipping_receiver_name
  end
  
end
