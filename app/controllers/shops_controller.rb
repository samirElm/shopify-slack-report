class ShopsController < ShopifyApp::AuthenticatedController
  def show
    @shop = Shop.current
  end

  def edit
    @shop = Shop.current
  end

  def update
    @shop = Shop.current
  end
end