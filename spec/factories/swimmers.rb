
FactoryGirl.define do

  #Defines a default user for use in the tests
  factory :swimmer do
    asa_number 12345
    asa_category 'Paid Cat3'
    date_of_birth 2010-01-01
    sex 'Male'
    photo_consent 'True'
    current_squad 'B-Squad'


  end
end