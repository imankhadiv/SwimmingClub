# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  created_at         :datetime
#  updated_at         :datetime
#

FactoryGirl.define do


  # factory :role1 do
  #   name 'Administrator'
  # end
  factory :role do
    name 'Welfare Officer'
    end
  # factory :role3 do
  #   name 'Committee'
  #   end
  # factory :role4 do
  #   name 'Parent'
  #   end
  # factory :role5 do
  #   name 'Swimmer'
  #   end
  # factory :role6 do
  #   name 'Coach'
  # end

  #Defines a default user for use in the tests
  factory :user do
     email 'myfirstname@yahoo.com'
    # email { Faker::Internet.email }


    password '123456789'
    password_confirmation '123456789'
    first_name 'first_name'
    last_name 'last_name'
    level 'Welfare Officer'
    approved 'False'
  end

  # user.roles << Role.first

end