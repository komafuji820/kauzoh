class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :purchases, dependent: :destroy

  validates :name, presence: true
  
end
