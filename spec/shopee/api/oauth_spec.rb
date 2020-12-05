RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URI"],
      shopid: ENV["SHOPID"],
    })
  }
  let(:invalid_subject) { Shopee::Api.new({ partner_id: nil, partner_key: " ", redirect_uri: "https://www.google.com.br/", shopid: "3" }) }

  describe "#build_auth_url" do
    it "valid url" do
      expect(subject.build_auth_url()).to include(:ok)
    end

    it "invalid url" do
      expect { invalid_subject.build_auth_url() }.to raise_error(ArgumentError)
    end
  end

  describe "#get_access_token" do
    it "success" do
    end

    it "invalid code" do
      expect(subject.get_access_token("123")).to include(:error)
    end
  end

  describe "#refresh_token" do
    it "success" do
    end

    it "error" do
      expect(subject.get_access_token("123")).to include(:error)
    end
  end
end
