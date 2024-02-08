FactoryBot.define do
  factory :item do
    name                {Faker::Lorem.sentence}
    comment             {Faker::Lorem.sentence}
    price               {Faker::Number.between(from: 300, to: 9999999)}

    association :category, id: 2
    association :condition, id: 2
    association :delivery_charge, id: 2
    association :prefecture, id: 2
    association :day_required, id: 2
    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
   end
  end
end
