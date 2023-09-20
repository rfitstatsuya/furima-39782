class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :house_number, :building_name,
                :telephone_number, :order_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(post_code:, prefecture_id:, city:, house_number:,
                   telephone_number:, building_name:, order_id: order.id)
  end
end
