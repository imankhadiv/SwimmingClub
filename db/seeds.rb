# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  user1= User.create :email =>"swimmer@sheffield.ac.uk",
                     :password =>"123456789",
                     :password_confirmation =>"123456789",
                     :first_name =>'myfirstname',
                     :last_name =>'mylastname',
                     :level =>'Swimmer',
                     :approved =>TRUE


  #
  swimmer1 = Swimmer.create asa_number: '1234',
                            asa_category: 'cat',
                            ethnic: 'White',
                            date_of_birth: Date.yesterday,
                            sex: 'Female',
                            photo_consent: 'yes',
                            current_squad: 'squad',
                            user_id: user1.id

  address1 = Address.create line1: 'Solly',
                            city: 'Sheffield',
                            postcode: 'Sekrje',
                            telephone: '1234567890',
                            emergency_contact: '1234567890',
                            addressable_id: swimmer1.id,
                            addressable_type: 'Swimmer'

  #
  medical = MedicalCondition.create swimmer_id: swimmer1.id,
                                    doctor: 'John'


  address2 = Address.create line1: 'Solly',
                            city: 'Sheffield',
                            postcode: 'Sekrje',
                            telephone: '1234567890',
                            emergency_contact: '1234567890',
                            addressable_id: medical.id,
                            addressable_type: 'MedicalCondition'





  user3= User.create :email =>"swimmer2@sheffield.ac.uk",
                     :password =>"123456789",
                     :password_confirmation =>"123456789",
                     :first_name =>'myfirstname',
                     :last_name =>'mylastname',
                     :level =>'Swimmer',
                     :approved =>TRUE


  #
  swimmer3 = Swimmer.create asa_number: '1234',
                            asa_category: 'cat',
                            ethnic: 'White',
                            date_of_birth: Date.yesterday,
                            sex: 'Female',
                            photo_consent: 'yes',
                            current_squad: 'squad',
                            user_id: user3.id

  address1 = Address.create line1: 'Solly',
                            city: 'Sheffield',
                            postcode: 'Sekrje',
                            telephone: '1234567890',
                            emergency_contact: '1234567890',
                            addressable_id: swimmer3.id,
                            addressable_type: 'Swimmer'

  #
  medical3 = MedicalCondition.create swimmer_id: swimmer3.id,
                                    doctor: 'John'


  address2 = Address.create line1: 'Solly',
                            city: 'Sheffield',
                            postcode: 'Sekrje',
                            telephone: '1234567890',
                            emergency_contact: '1234567890',
                            addressable_id: medical3.id,
                            addressable_type: 'MedicalCondition'






  user2= User.create :email =>"parent@sheffield.ac.uk",
                     :password =>"123456789",
                     :password_confirmation =>"123456789",
                     :first_name =>'myfirstname',
                     :last_name =>'mylastname',
                     :level =>'Parent',
                     :approved =>TRUE

  parent1 = Parent.create user_id: user2.id,
                            relation: 'Father'

  address1 = Address.create line1: 'Solly',
                            city: 'Sheffield',
                            postcode: 'Sekrje',
                            telephone: '1234567890',
                            emergency_contact: '1234567890',
                            addressable_id: parent1.id,
                            addressable_type: 'Parent'

  parent1.swimmers << swimmer1
  parent1.swimmers << swimmer3




