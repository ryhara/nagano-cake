class Address < ApplicationRecord
  belongs_to :customer
  validates :customer_id ,presence: true
  validates :receiver_name ,presence: true
  validates :post_code ,presence: true
  validates :address ,presence: true
  
    
  def full_address
    self.post_code + " " + self.address + " " + self.receiver_name
  end
end
