class Order < ApplicationRecord
  belongs_to :user
  has_one :user_address
  belongs_to :item
end
