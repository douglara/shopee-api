RSpec.describe Auth1 do
  let(:endpoint_url) { 'https://partner.uat.shopeemobile.com' }
  let(:partner_id) { ENV['PARTNER_ID'] }
  let(:partner_key) { ENV['PARTNER_KEY'] }
  let(:redirect_url) { ENV['REDIRECT_URL'] }
  let(:shop_id) { ENV['SHOPID'] }

  describe 'methods' do
    describe '#build_auth_url' do
      it 'valid url' do
        expect(subject.build_auth_url(endpoint_url, partner_id, partner_key, redirect_url)).to include(:ok)
      end
    end
    describe '#generate_authorization' do
      let(:path) { '/api/v1/orders/basics' }
      let(:data) { "{\"ordersn\": \"160726152598865\", \"shopid\": #{shop_id}, \"partner_id\": #{partner_id}, \"timestamp\": 1470198856}" }
      it 'valid url' do
        expect(subject.generate_authorization(endpoint_url, path, data, partner_key)).to include(:ok)
      end
    end
  end
end
