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

  #Defines a default user for use in the tests
  factory :user do
    email 'user1@yahoo.com'
    password '123456789'
    password_confirmation '123456789'
    first_name 'first_name'
    last_name 'last_name'
    level 'Administrator'
    approved 'False'
  end

end