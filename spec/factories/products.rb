FactoryGirl.define do
  factory :product do
    name {Faker::Name.name}
    description {Faker::Hacker.say_something_smart}
    price {Faker::Number.decimal 1}
    quantity {Faker::Number.number 1}
    image {Faker::Name.name}
    status 1
    category_id {Category.first.id}
  end
end
