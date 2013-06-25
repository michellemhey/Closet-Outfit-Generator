require 'faker'

FactoryGirl.define do
  factory :clothing do |f|
    f.name { Faker::Lorem.words(num = 5, supplemental = false) }
    f.type_id { rand(1..100) }
    f.user_id { rand(1..100) }
  end
end