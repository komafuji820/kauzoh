class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '食品・飲料' },
    { id: 2, name: 'キッチン用品' },
    { id: 3, name: 'トイレ・バス用品' },
    { id: 4, name: '日用品' },
    { id: 5, name: '医薬品' },
    { id: 6, name: '衣料品' },
    { id: 7, name: 'ベビー・介護用品' },
    { id: 8, name: 'ペット用品' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items

end