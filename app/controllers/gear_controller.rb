class GearController < ApplicationController
  
  before_action :find_gear, only: [:edit, :destroy, :update]

  def new
  end

  def create
    p = gear_params
    p[:climber_id] = current_user.id
    @gear = Gear.create(p)
    redirect_to(@gear)
  end

  def edit
  end

  def update
    Gear.update(@gear.id, gear_params)
    redirect_to(@gear)
  end

  def destroy
    @gear.destroy
    redirect_to action: 'index'
  end

  private
  
  def find_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.required(:gear).permit(:description, :quantity)
  end

end
