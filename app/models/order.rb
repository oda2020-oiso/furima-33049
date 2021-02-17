class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to :item
  belongs_to :user

  validates :prefecture, numericality: { other_than: 1 }

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end


end
