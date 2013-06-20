require 'faker'

FactoryGirl.define do
  factory :type_class_id do |f|
    f.name { Faker::Lorem.words(num = 11, supplemental = false) }
  end
end