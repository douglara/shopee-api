RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV["PARTNER_ID"],
      partner_key: ENV["PARTNER_KEY"],
      redirect_uri: ENV["REDIRECT_URI"],
      shopid: ENV["SHOPID"]
    })
  }

  describe 'methods' do
    describe '#build_auth_url' do
      it 'valid url' do
        expect(subject.build_auth_url()).to include(:ok)
      end
    end
    describe '#get_access_token', :vcr do
      it 'should success' do
        expect(subject.get_access_token(ENV["AUTH_CODE"])).to include(:ok)
      end
    end
  end
end
