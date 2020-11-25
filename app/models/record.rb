class Record < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :item
  has_one    :delivery_address
  has_one    :form_record

end
