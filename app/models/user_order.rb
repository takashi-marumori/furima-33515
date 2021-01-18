class user_order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number
  
  with_options presence: true do
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :municipality
  validates :address
  validates :phone_number, format: { with: ^0\d{9,10}$,^0\d{2,3}-\d{1,4}-\d{4}$ }
  end

  validates :prefecture, numericality: { other_than: 1 }

  def save
    Residence.create(postal_code: postal_code,prefecture_id: prefecture_id,municipality: municipality,address: address, building_name: building_name,phone_number: phone_number)
    Order.create(user_id: user.id,item_id: item.id)
  end


end