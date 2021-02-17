class OrderDistribution

  include ActiveModel::modules
  attr_accessor :postal_code, :city, :prefecture_id, :building_name, :address: :phone_number

  validates :token, presence: true
  validates :prefecture, numericality: { other_than: 1 }

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :address
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user.id, item_id: params[:item_id])
    Distribution.create(postal_code: postal_code, prefecture: prefecture, city: city, building_name: building_name, address: address, order_id: order.id)
  end
end