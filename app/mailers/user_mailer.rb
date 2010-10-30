class UserMailer < ActionMailer::Base
  default :from => "antillas21@gmail.com"
  
  def registration_confirmation(user)
    mail(:to => user.email, :subject => "Bienvenido a Control de Booths")
  end
end
