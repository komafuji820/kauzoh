class Order < ApplicationRecord
  belongs_to :group
  belongs_to :item

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :priority
  
end