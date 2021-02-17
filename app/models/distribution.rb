class Distribution < ApplicationRecord
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, 
end
