require 'rails_helper'

describe Shop do
  it "is invalid without a shopify domain" do
    FactoryGirl.build(:shop, shopify_domain: nil).should_not be_valid
  end
  it "is invalid without a shopify token" do
    FactoryGirl.build(:shop, shopify_token: nil).should_not be_valid
  end
end