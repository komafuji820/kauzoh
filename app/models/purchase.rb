class Purchase < ApplicationRecord
  belongs_to :group
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :priority
  belongs_to :category

  validates :priority_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 4 }

  validates :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 9 }

  validates :memo, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def self.destroy_purchases(purchase_ids)
    if purchase_ids.present?
      purchases = Purchase.find(purchase_ids)
      purchases.each do |purchase|
        purchase.destroy
      end
    end
  end

end
