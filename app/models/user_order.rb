class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # 購入情報を保存
    Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    UserAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
