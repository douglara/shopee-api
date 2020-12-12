require "httparty"

module Shopee
  module Http
    def post_request(path, body = {})
      body_to_send = prepare_body(body)
      puts(body_to_send)
      response = HTTParty.post("#{@endpoint_url}#{path}",
                               :headers => headers_request(path, body_to_send),
                               :body => body_to_send)
    end

    private

    def prepare_body(body)
      timest = Time.now.getutc.to_i
      body = body.merge({ 'shopid': @shopid, partner_id: @partner_id, 'timestamp': timest })
      body.to_json
    end

    def headers_request(path, body_to_send)
      { 'Content-Type': 'application/json', 'Authorization': Auth1.generate_authorization(@endpoint_url, path, body_to_send, @partner_key )[:ok] }
    end
  end
end
