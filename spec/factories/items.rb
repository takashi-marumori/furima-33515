FactoryBot.define do
  factory :item do
    title                 { 'test' }
    explanation           { 'test' }
    price                 { '10000' }
    category_id           { '2' }
    item_status_id        { '2' }
    burden_id             { '2' }
    prefecture_id         { '2' }
    day_id                { '2' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end