RSpec.describe Shopee::Api do
  let(:subject) {
    Shopee::Api.new({
      partner_id: ENV['PARTNER_ID'],
      partner_key: ENV['PARTNER_KEY'],
      redirect_uri: ENV['REDIRECT_URI'],
      shopid: ENV['SHOPID'],
      production: true,
      api_version: 'v1'
    })
  }

  describe "#init_logistic", :vcr do
    it "success" do
      expect(subject.init_logistic('1234', {'dropoff': {}, 'info_needed': ['dropoff': ['tracking_no']]})).to include(:ok)
    end

    it "error" do
      expect(subject.init_logistic('123', {'dropoff': {}})).to include(:ok)
    end
  end

  describe 'get_parameter_for_init', :vcr do
    it 'valid' do
      expect(subject.get_parameter_for_init('123')).to include(:ok)
    end

    it 'invalid' do
      expect(subject.get_parameter_for_init('invalid')).to include(:ok)
    end
  end


  describe 'get_logistic_info', :vcr do
    it 'success' do
      expect(subject.get_logistic_info('123')).to include(:ok)
    end
  end

  describe 'get_branch', :vcr do
    it 'success' do
      expect(subject.get_branch('123')).to include(:ok)
    end
  end
end
