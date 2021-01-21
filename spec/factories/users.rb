FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '111aaa' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    read_first_name       { 'タロウ' }
    read_last_name        { 'タナカ' }
    date                  { '1950/1/1' }
  end
end
