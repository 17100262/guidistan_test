class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(email)
    # Do something later
    # @user = user
    BasicMailer.send_email(email).deliver_later
  end
end
