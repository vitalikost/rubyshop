class ItemOrder < ApplicationRecord
  belongs_to :order, optional: true
end
