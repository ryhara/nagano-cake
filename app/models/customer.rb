class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name ,presence: true
  validates :first_name ,presence: true
  validates :last_name_kana ,presence: true
  validates :first_name_kana ,presence: true
  validates :post_code ,presence: true
  validates :address ,presence: true
  validates :telephone_number ,presence: true
  
  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  def full_address
    "〒" + self.post_code + " " + self.address + " " + self.last_name + " " + self.first_name
  end
end
