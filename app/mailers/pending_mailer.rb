class PendingMailer < ActionMailer::Base
  default from: "from@example.com"

  def invite(pending_climber)
    @pending_climber = pending_climber
    @url_options = {}
    @url_options[:login] = pending_climber.token
    mail(to: pending_climber.email, subject: "Welcome to YCTs new webapp!")
  end
end
