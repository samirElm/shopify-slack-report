FactoryGirl.define do
  factory :shop do
    shopify_domain    "exemple.myshopify.com"
    shopify_token     "1234hdjsd37646dghsghd"
    slack_webhook_url "https://hooks.slack.com/services/TOKEN"
  end
end