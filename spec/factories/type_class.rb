require 'faker'

FactoryGirl.define do
  factory :type_class do |f|
    f.name { Faker::Lorem.words(num = 11, supplemental = false) }
    f.type_id { rand(1..100) }
    f.symbol { Faker::Lorem.words(num = 11) }
  end
end