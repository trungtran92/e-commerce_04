FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    address {Faker::Address.street_address}
    password "123456"
  end
end
