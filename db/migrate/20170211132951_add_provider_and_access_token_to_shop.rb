class AddProviderAndAccessTokenToShop < ActiveRecord::Migration
  def change
    add_column :shops, :access_token, :string, default: ''
  end
end
