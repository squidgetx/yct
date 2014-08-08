class ClimbersController < ApplicationController
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
  def edit
    @oldDesc = @climber.desc
    @oldName = @climber.name
    @method = 'put'
    @path = climber_path(@climber)
    render "new"
  end
  def new
    @method = 'post'
    @path = climbers_path
  end
  def create
    @climber = Climber.create(climb_params)
    redirect_to(@climber)
  end
  def update
    Climber.update(@climber.id, climb_params)
    respond_with @climber
  end
  def destroy
    @climber.destroy
    redirect_to :action => 'index'
  end

  def find_climber
    @climber = Climber.find(params[:id])
  end
  def climb_params
    params.required(:climber).permit(:name, :college, :year, :desc, :avatar)
  end

end
