RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URI"],
      shopid: ENV["SHOPID"],
    })
  }

  describe "#post_request" do
    it "valid url" do
      expect(subject.post_request("/api/v2/auth/access_token/get").code).to eq(200)
    end

    it "timeout request" do
    end

    it "valid request" do
    end

    it "invalid request" do
    end
  end
end
