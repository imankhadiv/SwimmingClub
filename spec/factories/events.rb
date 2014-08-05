
FactoryGirl.define do

  factory :event do
    title 'Event1'
    details 'some details'
    date Date.tomorrow
    time '10:00'
    duration '120'

  end

end