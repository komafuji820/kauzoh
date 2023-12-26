class Order < ApplicationRecord
  belongs_to :group
  belongs_to :category
  belongs_to :priority

end
