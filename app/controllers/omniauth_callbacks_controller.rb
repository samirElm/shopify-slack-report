class OmniauthCallbacksController < ShopifyApp::AuthenticatedController

  def slack
    Shop.current.update_attributes(provider: 'slack', access_token: request_access_token)

    flash[:notice] = "Your slack account has been connected successfully !"

    redirect_to root_path
  end

  private

  def request_access_token
    SlackService::Omniauth.new(code: params['code']).access_token
  end
end
