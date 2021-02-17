class Order < ApplicationRecord
  attr_accessor :token

  has_one :user
  has_one :item
  has_one :distribution
end
