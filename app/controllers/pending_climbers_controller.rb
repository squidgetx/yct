class PendingClimbersController < ApplicationController
  load_and_authorize_resource
  require 'securerandom'

  def index
    @pendings = PendingClimber.all
    @new = new_pending_climber_path
  end

  def new
    @pending_climber  = PendingClimber.new
    @index = pending_climbers_path
    render 'generate'
  end

  def create
    #emails = pending_climber_params[:email].split(",")
    #emails.each do |email|
      attributes = {role: pending_climber_params[:role],
                    email: pending_climber_params[:email],
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

  def destroy
    PendingClimber.find(params[:id]).destroy
    flash[:notice] = 'Invitation destroyed. The url will no longer grant access to the application'
    redirect_to 'index'
  end

  private

  def pending_climber_params
    params.require(:pending_climber).permit(:email,:role)
  end
end
