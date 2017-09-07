# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.delete_all

User.create(name: "Stefano Rusmogp",
			email: "stefo29@msn.com",
			password:"z29081990",
			password_confirmation:"z29081990")

10.times do 
User.create(name:Faker::Name.name,
			email:Faker::Internet.email,
			password:"password1",
			password_confirmation:"password1")
end
