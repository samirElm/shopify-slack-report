class SlackService::Omniauth
  require 'http'
  require 'json'

  attr_reader :code

  def initialize(args = {})
    @code = args[:code]
  end

  def access_token
    request_access['access_token']
  end

  private

  def request_access
    JSON.parse(HTTP.post('https://slack.com/api/oauth.access', params: {
      client_id: ENV["SLACK_CLIENT_ID"],
      client_secret: ENV["SLACK_CLIENT_SECRET"],
      code: code
    }))
  end
end
