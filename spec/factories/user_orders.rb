FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address { '渋谷1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
