RSpec.describe Auth1 do
  let(:endpoint_url) { 'https://partner.test-stable.shopeemobile.com' }
  let(:partner_id) { ENV['PARTNER_ID'] }
  let(:partner_key) { ENV['PARTNER_KEY'] }
  let(:redirect_url) { ENV['REDIRECT_URI'] }
  let(:shop_id) { ENV['SHOPID'] }

  describe 'methods' do
    describe '#build_auth_url' do
      it 'valid url' do
        expect(subject.build_auth_url(endpoint_url, partner_id, partner_key, redirect_url)).to include(:ok)
      end
    end
    describe '#generate_authorization' do
      let(:path) { '/api/v1/item/categories/get' }
      let(:data) { "{\"shopid\": #{shop_id}, \"partner_id\": #{partner_id}, \"timestamp\": #{Time.now.getutc.to_i}, \"language\": \"en\"}" }
      it 'valid url' do
        expect(subject.generate_authorization(path, data, endpoint_url, partner_key)).to include(:ok)
      end
    end
  end
end
