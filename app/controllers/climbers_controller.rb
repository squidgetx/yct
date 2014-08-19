class ClimbersController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter, only: [:new, :edit]
  include ActionView::Helpers::AssetUrlHelper
  before_action :find_climber, only: [:show, :edit, :destroy, :update]
  layout 'front_page', only: :show

  def index
    @climbers = Climber.all
    if session[:cas_user]
      @user = session[:cas_user]
    end
    if @appconfig.restrict_new_accounts
      @new = new_pending_climber_path if can? :invite, Climber
    else
      @new = new_climber_path
    end
  end

  def show
    @edit = edit_climber_path @climber if can? :edit, @climber
    if @appconfig.restrict_new_accounts
      @new = new_pending_climber_path if can? :invite, Climber
    else
      @new = new_climber_path
    end
    @posts = Post.view(current_user).where("climber_id = ?", @climber.id)
  end

  def new
    @token = params[:token]
    pending = PendingClimber.where(token: @token)
    if @appconfig.restrict_new_accounts
      raise CanCan::AccessDenied if (cannot? :create, Climber) && pending.empty?
    end
    # new users are allowed if they have a valid token or if they have
    # permission
    @role = pending.empty? ? "normal" : pending.first.role
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
      pending.first.destroy unless pending.empty?
      flash[:notice] = 'Account successfully created!'
      redirect_to(@climber)
    else
      @role = pending.empty? ? "normal" : pending.first.role
      @login = session[:cas_user]
      @can_edit_login = can? :create, Climber
      render :new
    end
  end

  def edit
    @login = @climber.login
    @can_edit_login = can? :create, Climber
  end

  def update
    Climber.update(@climber.id, climb_params)
    redirect_to @climber
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
