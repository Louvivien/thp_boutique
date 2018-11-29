class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
     mail(from: "colin.lecordier@gmail.com", to: @user.email,
          subject: "This is a nice welcome email")
   end
end
