class UserMailer < ApplicationMailer
  def welcome_email(mail_user)
    @mail_user = mail_user
    mail(from: "colin.lecordier@gmail.com", to: @mail_user,
        subject: "Bienvenue sur ce site de chaton")
   end
end
