class GearsController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_gear, only: [:edit, :destroy, :update]

  def new
    @gear = Gear.new
  end

  def create
    p = gear_params
    p[:climber_id] ||= current_user.id
    # check if climber already has this type of gear
    #gear = current_user.gears
    # gear.each do |g| 
    #  if g.gear_type_id == p[:gear_type_id].to_i
    #    g.quantity += p[:quantity].to_i
    #    if g.description.nil?
    #      g.description = p[:description]
    #    elsif p[:description].present?
    #      g.description += p[:description]
    #    end
    #    @gear = g
    #    break
    #  end
    # end
    @gear ||= Gear.new(p)
    if @gear.save
      redirect_to(current_user, notice: 'Gear successfully updated')
    else
      render :new
    end
  end

  def edit
  end

  def update
    Gear.update(@gear.id, gear_params)
    redirect_to(@gear)
  end

  def destroy
    @gear.destroy
    redirect_to request.referer
  end

  private
  
  def find_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.required(:gear).permit(:name, :description, :quantity, :gear_type_id, :climber_id)
  end

end
