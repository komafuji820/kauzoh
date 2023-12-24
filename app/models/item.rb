class Item < ApplicationRecord
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category

  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 9 }
  
end
