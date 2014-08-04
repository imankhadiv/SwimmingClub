# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if User.count ==0
  user1= User.create :email =>"admin@sheffield.ac.uk",
                     :password =>"123456789",
                     :password_confirmation =>"123456789",
                     :first_name =>'myfirstname',
                     :last_name =>'mylastname',
                     :level =>'Administrator',
                     :approved =>TRUE

end