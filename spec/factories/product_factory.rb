FactoryBot.define do

  sequence(:id){ |n| "#{n}"}

  factory :product do
    id
    name "TestNameEP"
    description "Bla Bla lala"
    price 130
  end
end
