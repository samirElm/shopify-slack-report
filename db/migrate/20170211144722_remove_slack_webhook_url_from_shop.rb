class RemoveSlackWebhookUrlFromShop < ActiveRecord::Migration
  def change
    remove_column :shops, :slack_webhook_url
  end
end
