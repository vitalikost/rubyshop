class Product < ApplicationRecord
  mount_uploaders :images, ImageUploader
  has_many :line_items
end
