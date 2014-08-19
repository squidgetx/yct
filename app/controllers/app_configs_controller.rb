class AppConfigsController < ApplicationController

# GET /app_configs/1/edit
  def edit
    @app_config = AppConfig.first
  end

  # PATCH/PUT /app_configs/1
  # PATCH/PUT /app_configs/1.json
  def update
    respond_to do |format|
      if @app_config.update(app_config_params)
        format.html { redirect_to @app_config, notice: 'App config was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_config }
      else
        format.html { render :edit }
        format.json { render json: @app_config.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_config_params
      params[:app_config].permit(:title, :member_name, :about, :restrict_new_accounts)
    end
end
