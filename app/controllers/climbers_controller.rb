class ClimbersController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter, only: [:new]
  before_action :find_climber, only: [:show, :edit, :destroy, :update]

  respond_to :html, :json

  def index
    @climbers = Climber.all
    if session[:cas_user]
      @user = session[:cas_user]
    end
  end

  def show
  end

  def new

    @token = params[:token]
    pending = PendingClimber.where(token: @token)

    raise CanCan::AccessDenied if (cannot? :create, Climber) && pending.empty?
    # new users are allowed if they have a valid token or if they have
    # permission
    @email = pending.first.email unless pending.empty?
    @climber = Climber.new
    @login = session[:cas_user]
    @can_edit_login = can? :create, Climber
  end

  def create
    pending = PendingClimber.where(token: params[:token])
    raise CanCan::AccessDenied if (cannot? :create, Climber) && pending.nil?
    # same code from new action, for people trying to hack in a post request
    @climber = Climber.new(climb_params)
    if @climber.save
      redirect_to(@climber)
    else
      @email = pending.first.email unless pending.empty?
      @login = session[:cas_user]
      @can_edit_login = can? :create, Climber
      render :new
    end
  end

  def update
    Climber.update(@climber.id, climb_params)
    respond_with @climber
  end

  def destroy
    @climber.destroy
    redirect_to :action => 'index'
  end

  private

  def find_climber
    @climber = Climber.find(params[:id])
  end

  def climb_params
    params.required(:climber).permit(:name, :college, :year, :desc, :avatar, :login, :role, :title, :email)
  end

end
