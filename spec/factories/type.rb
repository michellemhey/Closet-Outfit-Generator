require 'faker'

FactoryGirl.define do
  factory :type do |f|
    f.name { Faker::Lorem.words(num = 11, supplemental = false) }
    f.description { Faker::Lorem.sentences(sentence_count = 5, supplemental = false) }
  end
end