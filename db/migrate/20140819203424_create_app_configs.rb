class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :title
      t.text :about
      t.string :member_name
      t.boolean :restrict_new_accounts
    end
  end
end
