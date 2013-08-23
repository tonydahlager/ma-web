# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_topic, :class => 'Admin::Topic' do
    title "MyString"
    description "MyString"
  end
end
