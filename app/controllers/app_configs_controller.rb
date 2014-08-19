class AppConfigsController < ApplicationController

# GET /app_configs/1/edit
  def edit
    authorize! :edit, :configs
    @app_config = AppConfig.first
  end

  # PATCH/PUT /app_configs/1
  # PATCH/PUT /app_configs/1.json
  def update
    authorize! :update, :configs
    @app_config = AppConfig.first
    respond_to do |format|
      if @app_config.update(app_config_params)
        format.html { redirect_to static_pages_settings_path, notice: 'App config was successfully updated.' }
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
      params[:app_config].permit(:title, :member_name, :about, :restrict_new_accounts, :events_header, :climbers_header, :posts_header)
    end
end
