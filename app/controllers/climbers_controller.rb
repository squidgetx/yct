class ClimbersController < ApplicationController
	before_action :find_climber, only: [:show, :edit, :destroy]
	
	def index
		@climbers = Climber.all
	end
	def show
		
	end
	def edit

	end
	def new
	end
	def create
		@climber = Climber.create(climb_params)
		redirect_to(@climber)
		#render plain: params[:climber].inspect
	end
	def destroy
	
	end
	
	def find_climber
		@climber = Climber.find(params[:id])
	end
	def climb_params
		params.required(:climber).permit(:name, :state)
	end
	
end
