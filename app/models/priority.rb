class Priority < ActiveHash::Base
  self.data = [
    { id: 1, name: 'いますぐ！' },
    { id: 2, name: '数日以内' },
    { id: 3, name: '何かのついでに' },
    { id: 4, name: 'そのうち' }
  ]

  include ActiveHash::Associations
  has_many :orders

end