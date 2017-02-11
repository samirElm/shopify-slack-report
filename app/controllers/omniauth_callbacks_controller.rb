class OmniauthCallbacksController < ShopifyApp::AuthenticatedController
  require 'http'
  require 'json'

  def slack
    Shop.current.update_attributes(provider: 'slack', access_token: request_access_token)

    JSON.parse(HTTP.post('https://slack.com/api/chat.postMessage', params: {
      token: Shop.current.access_token,
      channel: '#general',
      text: 'Hello world!'
    }))

    redirect_to root_path
  end

  private

  def request_access_token
    call_oauth['access_token']
  end

  def call_oauth
    JSON.parse(HTTP.post('https://slack.com/api/oauth.access', params: {
      client_id: ENV["SLACK_CLIENT_ID"],
      client_secret: ENV["SLACK_CLIENT_SECRET"],
      code: params['code']
    }))
  end
end
