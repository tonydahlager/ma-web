# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :direction do
    order 1
    approach "MyString"
    content "MyString"
  end
end
