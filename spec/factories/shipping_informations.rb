FactoryBot.define do
  factory :shipping_information do
    postcode { '123-4567' }
    prefecture_id { 2 }  
    municipalities { 'Sample City' }
    block { 'Sample Block' }
    phone_number { '1234567890' }
    building { 'Sample Building' }


    association :buy
  end
end
