RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URI"],
      shopid: ENV["SHOPID"],
      api_version: 'v1'
    })
  }

  describe "#get_items", :vcr do
    it "success" do
      expect(subject.get_items).to include(:ok)
    end

    context 'v2' do
      let(:subject) {
        Shopee::Api.new({
          partner_id: ENV["PARTNER_ID"],
          partner_key: ENV["PARTNER_KEY"],
          redirect_uri: ENV["REDIRECT_URI"],
          shopid: ENV["SHOPID"],
          api_version: 'v2',
          access_token: ENV['AUTH_ACCESS_TOKEN']
        })
      }

      it "success" do
        items = subject.get_items
        expect(items).to include(:ok)
        expect(items[:ok]['error']).to eq('')
      end
    end
  end
end
