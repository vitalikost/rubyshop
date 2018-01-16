class AttributeProductValue < ApplicationRecord
  belongs_to :product
  belongs_to :attribute_value
end
