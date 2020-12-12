RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URL"],
      shopid: ENV["SHOPID"],
      access_token: ENV["AUTH_ACCESS_TOKEN"],
      refresh_token: ENV["AUTH_REFRESH_TOKEN"],
    })
  }

  describe "#get_order" do
    it "success" do
    end

    it "error" do
    end
  end

  describe "#get_orders", :vcr do
    it "success" do
      #puts(subject.get_access_token(ENV['AUTH_CODE'], ENV['SHOPID']).inspect)
      expect(subject.get_orders).to include(:ok)
    end

    it "error" do
    end
  end
end
