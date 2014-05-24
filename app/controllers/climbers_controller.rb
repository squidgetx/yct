class ClimbersController < ApplicationController
	def show
		@climber = Climber.find(params[:id])
	end
	def index
		@climbers = Climber.all
	end
end
