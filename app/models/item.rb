class Item < ApplicationRecord
  belongs_to :group
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :category

  has_one_attached :image

  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 9 }

  validates :memo, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
  
end
