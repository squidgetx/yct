class AddHeadersToAppConfigs < ActiveRecord::Migration
  def change
    add_column :app_configs, :events_header, :string
    add_column :app_configs, :posts_header, :string
    add_column :app_configs, :climbers_header, :string
  end
end
