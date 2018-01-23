class Order < ApplicationRecord
  enum status: [:new_order, :work_order, :done_order]
  has_many :item_orders, dependent: :destroy
  validates :name, presence: true,
            length: { minimum: 5 }
  validates :phone, presence: true,
            length: { minimum: 10 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
