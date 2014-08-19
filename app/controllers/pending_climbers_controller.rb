class PendingClimbersController < ApplicationController
  load_and_authorize_resource
  require 'securerandom'

  def new
    @pending_climber  = PendingClimber.new
    render 'generate'
  end

  def create
    #emails = pending_climber_params[:email].split(",")
    #emails.each do |email|
      attributes = {role: pending_climber_params[:role],
                    token: SecureRandom.urlsafe_base64(42)
      }

      n = PendingClimber.create(attributes)
      #PendingMailer.invite(n).deliver
    #end
    #flash[:notice] = "Invitations sent successfully!"
      @url_options = { token: n[:token] }
      @url = new_climber_url + '?' + @url_options.to_query
    respond_to do |format|
      format.js {}
      format.html { render 'generate' }
    end
  end

  private

  def pending_climber_params
    params.require(:pending_climber).permit(:email,:role)
  end
end
