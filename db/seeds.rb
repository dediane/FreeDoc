# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do 
  city = City.create!(
    name: Faker::Address.city
  )
end

10.times do 
  doctor = Doctor.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    zip_code: Faker::Address.zip_code,
    speciality: ["dentist", "surgeon", "cardiologist", "ophtamologist", "family doctor", "pediatrician", "dermatologist"].sample,
    city: City.all.sample
  )
end

20.times do
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: City.all.sample
  )
end

30.times do
  doc = Doctor.all.sample
  appointment = Appointment.create!(doctor:doc, patient:Patient.all.sample, city:doc.city)
end






  
