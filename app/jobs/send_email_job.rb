class SendEmailJob < ActiveJob::Base
  # include Sidekiq::Worker
  queue_as :default

  def perform(user)
    # Perform Job
    logger.info "Things are happening."
    BasicMailer.welcome_email(user).deliver_now unless user.invalid?
  end

  # def perform(email)
  #   # Do something later
  #   # @user = user
  #   BasicMailer.send_email(email).deliver_later
  # end
end
