class Order < ApplicationRecord
  belongs_to :group
  belongs_to :category

end
