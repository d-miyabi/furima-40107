class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :addresses, :building, :prefecture, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :user_id, presence: true
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number, presence: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Do not Include hyphen(-)"}
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, order_id: order.id )
  end
end