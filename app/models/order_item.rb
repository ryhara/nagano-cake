class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :taxed_price, presence: true
  validates :item_count, presence: true
  validates :making_status, presence: true
  
  enum making_status: {cannot_start: 0, waiting: 1, making: 2, complete: 3}
end
