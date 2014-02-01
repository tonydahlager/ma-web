FactoryGirl.define do
  
  factory :barrier do
    title "MyString"
    
    factory :barrier_full, class: Barrier do 
      ignore { count 2 }
      after(:create) do |barrier, evaluator|
        create_list(:context, evaluator.count, barrier: barrier)
        create_list(:question, evaluator.count, barrier: barrier)
      end
    end
  end  
  
end
