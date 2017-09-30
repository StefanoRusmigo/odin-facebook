class Profile < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :surname, presence: true
    after_create {WelcomeMailer.welcome_email(self.user).deliver}


	def full_name
		"#{name.capitalize} #{surname.capitalize}"
	end

end
