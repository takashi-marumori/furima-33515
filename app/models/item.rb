class Item < ApplicationRecord
  belongs_to :user
  has_one :genre
  has_one_attached :image
end
