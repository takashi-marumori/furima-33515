class Item < ApplicationRecord
  belongs_to :user
  has_one :genre
  has_one_attached :image

  with_options presence: true do
    validates :title 
    validates :explanation
    validates :price,format: { with:/\A[0-9]+\z/},length: { in:300..9999999 }
    validates :category_id
    validates :item_status_id
    validates :burden_id
    validates :prefecture_id
    validates :day_id
    validates :image, presence: true
  end
end