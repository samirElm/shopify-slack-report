class ShopsController < ShopifyApp::AuthenticatedController
  def show
    @shop = Shop.current
  end

  def edit
    load_shop
  end

  def update
    load_shop
    @shop.update(shop_params)

    if @shop.save
      flash[:notice] = "Your Webhook URL has been updated successfully !"

      redirect_to root_path
    else
      flash[:notice] = "An error occured, please check that you entered a valid Webhook URL."

      redirect_to :back
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:slack_webhook_url)
  end

  def load_shop
    @shop = Shop.find(params[:id])
  end
end