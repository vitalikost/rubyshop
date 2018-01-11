class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  has_many :line_items
  has_many :item_orders
  belongs_to :category
  validates :name, presence: true,
            length: { minimum: 10 }
end
