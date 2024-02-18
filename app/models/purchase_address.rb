class Purchase_address
  include ActiveModel::Model
  attr_accessor :item, :user_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :purchase

  with_options presence: true do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: 'is invalid'}
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchase = Purchase.create(item: item, user_id: user_id)
    address = Address .create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name )
end