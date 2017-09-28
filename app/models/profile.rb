class Profile < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :surname, presence: true

	def full_name
		"#{name.capitalize} #{surname.capitalize}"
	end
end
