class Order < ApplicationRecord
  belongs_to :group
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :priority
  
  validates :priority_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 4 }

  def self.destroy_orders(order_ids)
    if order_ids.present?
      orders = Order.find(order_ids)
      orders.each do |order|
        order.destroy
      end
    end
  end
end