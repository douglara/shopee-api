RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV['PARTNER_ID'],
      partner_key: ENV['PARTNER_KEY'],
      redirect_uri: ENV['REDIRECT_URI'],
      shopid: ENV['SHOPID'],
      production: true,
      api_version: 'v1',
    })
  }

  describe '#get_order', :vcr do
    it 'valid' do
      expect(subject.get_order('123')).to include(:ok)
    end

    it 'invalid' do
      expect(subject.get_order('11111111111111')).to include(:ok)
    end

    context 'v2' do
      let(:subject) {
        Shopee::Api.new({
          partner_id: ENV['PARTNER_ID'],
          partner_key: ENV['PARTNER_KEY'],
          redirect_uri: ENV['REDIRECT_URI'],
          shopid: ENV['SHOPID'],
          api_version: 'v2',
          access_token: ENV['AUTH_ACCESS_TOKEN']
        })
      }

      it 'success' do
        expect(subject.get_order('123')).to include(:ok)
      end  
    end
  end

  describe '#get_orders', :vcr do
    it 'success' do
      expect(subject.get_orders).to include(:ok)
    end

    context 'v2' do
      let(:subject) {
        Shopee::Api.new({
          partner_id: ENV['PARTNER_ID'],
          partner_key: ENV['PARTNER_KEY'],
          redirect_uri: ENV['REDIRECT_URI'],
          shopid: ENV['SHOPID'],
          api_version: 'v2',
          access_token: ENV['AUTH_ACCESS_TOKEN']
        })
      }
    
      it 'success' do
        expect(subject.get_orders).to include(:ok)
      end  
    end
  end
end
