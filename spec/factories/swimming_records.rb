
FactoryGirl.define do

  #Defines a default user for use in the tests
  factory :swimming_record do

    first_name 'first_name'
    last_name 'last_name'
    gender     'Female'
    stroke      'Breaststroke'
    distance    1
    level       '3'
    meet        'meet'
    venue       'venue'
    time        '60'
    age         10
    region      'region'
    region_code  'region_code'


  end
end