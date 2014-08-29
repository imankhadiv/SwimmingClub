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
  factory :role1 do
    name 'Committee'
    end
  factory :role4 do
    name 'Parent'
    end
  factory :role5 do
    name 'Swimmer'
    end
  factory :role6 do
    name 'Coach'
  end

  #Defines a default user for use in the tests
  factory :user do
     email 'myfirstname@yahoo.com'
    # email { Faker::Internet.email }


    password '123456789'
    password_confirmation '123456789'
    first_name 'first_name'
    last_name 'last_name'
    level 'Welfare Officer'
    approved 'true'
  end

  # FactoryGirl.define do
  #   #Defines a default role for user
  #   factory :role do
  #     name 'Welfare Officer'
  #   end
  #   end


  FactoryGirl.define do

    #Defines a default user for use in t
    # tests
    factory :swimmer do
      asa_number 12345
      asa_category 'Paid Cat3'
      date_of_birth '2010-01-01'
      sex 'Male'
      photo_consent 'True'
      current_squad 'B-Squad'
      user_id 'user.id'
      ethnic 'Asian'


    end

    factory :swimmer_time do
      stroke 'BACK'
      times 120
      distance 50
      venue 'Sheffield'
      meet  'Sheffield'
      level 'level1'
      date Date.yesterday
      course 'Long Course'
      swimmer

    end





  end

end