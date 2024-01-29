
FactoryBot.define do
  factory :user do
    nickname                  {Faker::Name.initials(number: 2)}
    email                     {Faker::Internet.email}
    password                  {Faker::Internet.password(min_length: 6) + Faker::Number.between(from: 10, to: 99).to_s } 
    password_confirmation     {password} 
    last_name                 {"山田"} 
    first_name                {"山田"} 
    last_name_kana            {"ヤマダ"}
    first_name_kana           {"ヤマダ"} 
    birthday                  {Faker::Date.birthday(min_age: 20,max_age: 150)}
  end
end
