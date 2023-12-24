class Item < ApplicationRecord
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  
end
