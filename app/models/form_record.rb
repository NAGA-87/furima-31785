class FormRecord
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1, message: 'status Select' }
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end
end