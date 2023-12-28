class Order < ApplicationRecord
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category
  belongs_to :priority

end
