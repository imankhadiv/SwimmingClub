
FactoryGirl.define do

  factory :event do
    title 'Event1'
    details 'some details'
    date Date.tomorrow
    start '10:00'
    finish '12:00'

  end

end