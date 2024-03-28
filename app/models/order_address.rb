class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id ,:token, :price
  
  with_options presence: true do
   validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
   validates :prefecture_id
   validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
   validates :house_number, format: { with: /\A[0-9A-Za-z-]+\z/ }
   validates :phone_number, format: { with: /\A\d{2,4}[-(]?\d{1,4}[-)]?\d{4}\z/}
   validates :user_id
   validates :item_id
   validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,city: city, house_number: house_number,building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end