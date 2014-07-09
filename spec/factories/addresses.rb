# one:
#     line1: MyString
# line2: MyString
# city: MyString
# postcode: MyString
# telephone: 1
# emergency_contact: MyString
# addressable_id: 1
# addressable_type: MyString
#
# two:
#     line1: MyString
# line2: MyString
# city: MyString
# postcode: MyString
# telephone: 1
# emergency_contact: MyString
# addressable_id: 1
# addressable_type: MyString
FactoryGirl.define do

  #Defines a default user for use in the tests
  factory :address do
    line1 'Solly Street'
    line2 'Holly Street'
    city  'Sheffield'
    postcode 'SA87Gf'
    telephone '01234567890'
    emergency_contact '01234567890'

  end

end