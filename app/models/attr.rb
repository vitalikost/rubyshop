class Attr < ApplicationRecord
  has_many :attribute_values
  accepts_nested_attributes_for :attribute_values, :allow_destroy => true
end
