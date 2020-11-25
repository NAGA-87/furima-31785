FactoryBot.define do
  factory :form_record do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { 'aaa' }
    house_number { '1-1' }
    building_name {''}
    phone_number { '09012345678' }
    item_id { '1' }
    user_id { '1' }
  end
end