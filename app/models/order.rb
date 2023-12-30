class Order < ApplicationRecord
  belongs_to :group
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :priority
  belongs_to :category
  
  validates :priority_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 4 }

  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 9 }
  
end