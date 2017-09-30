class WelcomeMailer < ApplicationMailer
	 def welcome_email(user)
  p	@user = user
  p	@url  = new_user_session_url
    mail(to: @user.email, subject: 'Welcome to Odin Social App')
  end
end
