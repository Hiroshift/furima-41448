class OrderForm
  include ActiveModel::Model
  # 必要なカラムを仮で定義
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  # バリデーションを記述
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number,
          presence: { message: "can't be blank" },
          length: { in: 10..11, message: 'is too short' },
          format: { with: /\A\d+\z/, message: 'is invalid. Input only number' }

                           
    validates :user_id
    validates :item_id
end

  

  def save
    # 購入履歴を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingInformation.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city,
      house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id
    )
  end
end