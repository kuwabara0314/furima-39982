FactoryBot.define do
  factory :buy_shipping_information do
    postcode {'123-4567'}
    prefecture_id { 2 }
    municipalities {'hoge市'}
    block {'hoge町'}
    building {'hogeビル'}
    phone_number { '09012345678' }
    association :user
    association :item
    token {"tok_abcdefghijk00000000000000000"}
  end
end
