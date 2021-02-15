FactoryBot.define do
  factory :item do
    name { 'ハム' }
    price {'1000'}
    description {'ほげふがが'}
    category_id {'2'}
    condition_id {'2'}
    carriage_id {'2'}
    prefecture_id {'2'}
    schedule_id {'2'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sumple.jpeg'), filename: "sumple.jpeg")
  end
end
