FactoryGirl.define do

  #Defines a default user for use in the tests
  factory :swimmer_time do
    stroke 'BACK'
    times 120
    distance 50
    venue 'Sheffield'
    date Date.yesterday
    course 'Long Course'

  end

end


