class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :title
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :burden_id
      validates :prefecture_id
      validates :day_id
    end
  end
end
