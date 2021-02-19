FactoryBot.define do
  factory :user do
    id { Faker::Number.unique.number(1) }
    nickname { Faker::Name.name }
    family_name { '織田' }
    first_name { '健太郎' }
    family_kana { 'オダ' }
    first_kana { 'ケンタロウ' }
    birthday { Faker::Date.birthday }
    email { Faker::Internet.email }
    password { 'Aj56kT71' }
    password_confirmation { password }
  end
end
