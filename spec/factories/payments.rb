FactoryGirl.define do

  #Defines a default user for use in the tests
  factory :payment do
    details 'some details'
    amount   20
    paid     'false'
    due_date  Date.tomorrow


  end
end
