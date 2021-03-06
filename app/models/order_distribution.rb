class OrderDistribution
  include ActiveModel::Model
  attr_accessor :postal_code, :city, :prefecture_id, :building_name, :address, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,11}\z/ }
    validates :user_id
    validates :item_id
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Distribution.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name,
                        address: address, phone_number: phone_number, order_id: order.id)
  end
end
