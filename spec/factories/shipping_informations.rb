FactoryBot.define do
  factory :shipping_information do
    postal_code { 'MyString' }
    prefecture_id { 1 }
    city { 'MyString' }
    house_number { 'MyString' }
    building_name { 'MyString' }
    phone_number { 'MyString' }
    order { nil }
  end
end
