class Item < ApplicationRecord

  validates :title,               presence: true
  validates :explain,             presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :fee_id,              presence: true
  validates :prefecture_id,       presence: true
  validates :days_to_delivery_id, presence: true
  validates :price,               presence: true

  # アソシエーション
  belongs_to :user
  # has_one   :record
  has_one_attached :image
  
end
