FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_kana { Faker::Name.last_name }
    first_kana { Faker::Name.first_name }
    birthday { Faker::Date.birthday }
    email { Faker::Internet.email }
    password { 'Aj56kT71' }
    password_confirmation { password }

  end
end
