class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0\d{2,5}-?\d{1,4}-?\d{1,4}\z/ },
                             numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 11 }
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    oeder = Order.create(user_id: user.id, item_id: item.id)
    Residence.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address,
                     building_name: building_name, phone_number: phone_number, order_id: oeder.id)
  end
end
