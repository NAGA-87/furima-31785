FactoryBot.define do
  factory :item do

    title { 'aaa' }
    explain { 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }
    price { '3000' }
    category_id {'2'}
    condition_id {'2'}
    fee_id {'2'}
    prefecture_id {'2'}
    days_to_delivery_id {'2'}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/sample_image.png'), filename: 'sample_image.png' )
    end

  end
end