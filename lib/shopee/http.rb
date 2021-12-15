require "httparty"

module Shopee
  module Http
    def post_request(path, body = {})
      body_to_send = prepare_body(body)
      response = HTTParty.post("#{prepare_url_params(path)}",
                               :headers => headers_request(path, body_to_send),
                               :body => body_to_send)
    end

    private

    def prepare_body(body)
      if @api_version == 'v1'
        timest = Time.now.getutc.to_i
        body = body.merge({ 'shopid': @shopid, partner_id: @partner_id, 'timestamp': timest })
      end
      body.to_json
    end

    def prepare_url_params(path)
      url = "#{@endpoint_url}#{path}"

      if @api_version == 'v2'
        timest = Time.now.getutc.to_i
        base_string = "#{@partner_id}#{path}#{timest}#{@access_token}#{@shopid}"
        sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
        url = "#{url}?partner_id=#{@partner_id}&shop_id=#{@shopid}&sign=#{sign}&timestamp=#{timest}&access_token=#{@access_token}"
      end

      url
    end

    def headers_request(path, body_to_send)
      if @api_version == 'v2'
        { 'Content-Type': 'application/json' }
      else
        { 'Content-Type': 'application/json', 'Authorization': Auth1.generate_authorization(path, body_to_send, @endpoint_url, @partner_key)[:ok] }
      end
    end
  end
end
