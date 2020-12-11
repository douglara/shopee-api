RSpec.describe Shopee::Api do
  it "has a version number" do
    expect(Shopee::VERSION).not_to be nil
  end

  describe "instance" do
    it "invalid params" do
      expect { Shopee::Api.new({}) }.to raise_error(ArgumentError)
    end

    it "valid params" do
      Shopee::Api.new({
        partner_id: ENV["PARTNER_ID"],
        partner_key: ENV["PARTNER_KEY"],
        redirect_uri: ENV["REDIRECT_URI"],
        shopid: ENV["SHOPID"]
      })
    end
  end
end
