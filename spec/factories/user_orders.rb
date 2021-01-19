FactoryBot.define do
  factory :user_order do
    user_id              { '1' }
    item_id              { '1' }
    postal_code          { '111-1111' }
    prefecture_id        { '2' }
    municipality         { 'あ区' }
    address              { 'あ町' }
    building_name        { 'あビル' }
    phone_number         { '0111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
