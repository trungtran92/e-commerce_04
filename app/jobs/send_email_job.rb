class SendEmailJob < ApplicationJob
  queue_as :default

  def perform user
    @user = user
    CustommerMailer.sample_email(@user).deliver_later
  end
end
