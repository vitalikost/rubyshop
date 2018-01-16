class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  has_many :line_items
  has_many :item_orders
  belongs_to :category
  has_many :attribute_product_values, dependent: :destroy
  has_many :attribute_values, through: :attribute_product_values
  validates :name, presence: true,
            length: { minimum: 10 }
end
