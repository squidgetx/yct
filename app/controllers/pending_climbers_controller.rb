class PendingClimbersController < ApplicationController
  load_and_authorize_resource
  require 'securerandom'

  def new
    @pending_climber  = PendingClimber.new
  end

  def create
    emails = pending_climber_params[:email].split(",")
    emails.each do |email|
      attributes = {email: email}
      attributes[:token] = SecureRandom.urlsafe_base64(42)
      n = PendingClimber.create(p)
      PendingMailer.invite(n).deliver
    end
    render :new
  end

  private

  def pending_climber_params
    params.require(:pending_climber).permit(:email)
  end
end
