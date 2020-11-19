class Item < ApplicationRecord

  validates :image, presence: true
  validates :title,               presence: true
  validates :explain,             presence: true
  validates :price,               presence: true, numericality: { greater_than: 299, less_than: 10_000_000, message: 'Out of setting range' }
  validates :price,               presence: true, numericality: { only_integer: true, message: 'Half-width number' }
  # アクティブハッシュの選択が「---」の時は保存されない
  validates :category_id, :condition_id, :fee_id, :prefecture_id, :days_to_delivery_id, numericality: { other_than: 1, message: 'status Select'}

  # アソシエーション
  belongs_to :user
  # has_one   :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :days_to_delivery

end
