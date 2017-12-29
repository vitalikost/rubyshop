class Order < ApplicationRecord
  has_many :item_orders, dependent: :destroy
  validates :name, presence: true,
            length: { minimum: 5 }
  validates :phone, presence: true,
            length: { minimum: 10 }
end
