FactoryBot.define do
  factory :order_distribution do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '浦安市' }
    address { '堀江' }
    building_name { 'ミッキータワー' }
    phone_number { '090912345678' }
    token { 'tok_9f6497c2849eafab6c34399aa7cd' }
  end
end
