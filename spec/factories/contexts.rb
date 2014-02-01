FactoryGirl.define do
  
  factory :context do
    title "MyString"
    
    factory :context_with_barriers, class: Context do 
    end
  end
end
