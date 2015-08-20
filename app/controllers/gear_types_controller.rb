class GearTypesController < ApplicationController
  
  before_action :find_gear_type, only: [:edit, :destroy, :update]

  def index
    @gear_types = GearType.all
    @new = new_gear_type_path(@gear_type)
  end

  def new
    @gear_type = GearType.new
  end

  def create
    p = gear_type_params
    @gear_type ||= GearType.new(p)
    if @gear_type.save
      redirect_to(gear_types_path, notice: 'Gear Type successfully updated')
    else
      render :new
    end
  end

  def edit
  end

  def update
    GearType.update(@gear_type.id, gear_params)
    redirect_to(gear_types_path)
  end

  def destroy
    @gear_type.destroy
    redirect_to request.referer
  end

  private
  
  def find_gear_type
    @gear_type = GearType.find(params[:id])
  end

  def gear_type_params
    params.required(:gear_type).permit(:name)
  end

end
