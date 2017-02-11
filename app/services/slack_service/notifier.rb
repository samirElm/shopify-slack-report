class SlackService::Notifier
  require 'http'

  attr_reader :notifiable

  def initialize(args = {})
    @notifiable = args[:notifiable]
  end

  def notify
    HTTP.post('https://slack.com/api/chat.postMessage', params: {
      token: notifiable.access_token,
      channel: notifiable.channel,
      attachments: notifiable.attachments
    })
  end
end
