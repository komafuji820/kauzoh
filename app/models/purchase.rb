class Purchase < ApplicationRecord
  belongs_to :group

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :priority
  belongs_to :category
end
