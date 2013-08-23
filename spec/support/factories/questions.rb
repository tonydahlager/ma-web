# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    topic_id 1
    content "MyString"
  end
end
