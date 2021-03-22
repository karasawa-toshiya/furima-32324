FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'testsample' }
    category_id            { '5' }
    status_id              { '7' }
    shipping_charges_id    { '3' }
    shipping_area_id       { '20' }
    delivery_days_id       { '2' }
    price                  { 300 }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
