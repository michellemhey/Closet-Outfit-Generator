# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :temperature do
    label "MyString"
    low 1
    high 1
  end
end
