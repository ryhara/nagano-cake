class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method, default: 0
      t.integer :billing_amount
      t.integer :shipping_fee
      t.string :shipping_receiver_name
      t.string :shipping_post_code
      t.string :shipping_address
      t.integer :order_status, default: 0
      t.timestamps
    end
  end
end
