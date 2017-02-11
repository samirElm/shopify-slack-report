class AddChannelToShop < ActiveRecord::Migration
  def change
    add_column :shops, :channel, :string, default: ''
  end
end
