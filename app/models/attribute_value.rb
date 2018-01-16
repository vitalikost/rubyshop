class AttributeValue < ApplicationRecord
  belongs_to :attr
  has_many :attribute_product_values, dependent: :destroy
  has_many :products, through: :attribute_product_values
end
