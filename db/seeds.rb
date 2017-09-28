# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.delete_all

User.create(email: "stefo29@msn.com",
			password:"z29081990",
			password_confirmation:"z29081990").create_profile(name:"Stefano",
															  surname: "Rusmigo",
															  avatar_url:"https://pbs.twimg.com/profile_images/3217410670/e21f8b532a006b13ba8d103f72f5fd4a.jpeg")

10.times do 
user = User.create(email:Faker::Internet.email,
				  password:"password1",
				  password_confirmation:"password1")
user.create_profile(name:Faker::Name.first_name,
					surname:Faker::Name.last_name)
end
