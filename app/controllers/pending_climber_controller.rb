class PendingClimberController < ApplicationController
  load_and_authorize_resource
  require 'securerandom'

  def new
  end

  def create
    p = pending_climber_params
    p[:token] = SecureRandom.urlsafe_base64(42)
    PendingClimber.create(p)
    PendingMailer.invite.deliver
  end

  private

  def pending_climber_params
    params.require(:pending_climber).permit(:email)
  end
end
