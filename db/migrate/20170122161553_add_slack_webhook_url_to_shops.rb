class AddSlackWebhookUrlToShops < ActiveRecord::Migration
  def change
    add_column :shops, :slack_webhook_url, :string, default: ""
  end
end
