class AddProviderToShop < ActiveRecord::Migration
  def change
    add_column :shops, :provider, :string, default: ''
  end
end
