class DeliveryAddress < ApplicationRecord

  #アソシエーション
  belongs_to :record
  has_one    :form_record
end
