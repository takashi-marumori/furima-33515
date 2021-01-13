class Item < ApplicationRecord
  belongs_to :user
  has_one :genre
  has_one_attached :image

  with_options presence: true do
    validates :title 
    validates :explanation
    validates :price
    validates :category_id
    validates :item_status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
  end
end