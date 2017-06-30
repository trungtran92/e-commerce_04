class CustommerMailer < ApplicationMailer
  default from: "trantrung92.ttt@example.com"

  def sample_email user
    @user = user
    mail to: @user.email, subject: "Sample Email"
  end
end
