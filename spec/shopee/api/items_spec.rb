RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URI"],
      shopid: ENV["SHOPID"]
    })
  }

  describe "#get_items", :vcr do
    it "success" do
      expect(subject.get_items).to include(:ok)
    end
  end
end
