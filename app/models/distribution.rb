class Distribution < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # belongs_to :order
  belongs_to_active_hash :prefecture

  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number
  end

end
