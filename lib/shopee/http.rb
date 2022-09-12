require "httparty"

module Shopee
  module Http
    def get_request(path, params = {})
      response = HTTParty.get("#{prepare_url_params(path, params)}",
                               :headers => headers_request(path))
    end
  
    def post_request(path, body = {})
      body_to_send = prepare_params(body, path)
      response = HTTParty.post("#{prepare_url_params(path)}",
                               :headers => headers_request(path, body_to_send),
                               :body => body_to_send.to_json)
    end

    def public_post_request(path, body = {})
      response = HTTParty.post("#{@endpoint_url}#{path}",
                               :headers => { 'Content-Type': 'application/json' },
                               :body => body.to_json)
    end

    private

    def prepare_params(body, path)
      timest = Time.now.getutc.to_i
      if @api_version == 'v1'
        body = body.merge({ 'shopid': @shopid, partner_id: @partner_id, 'timestamp': timest })
      else
        body = body.merge(get_auth_params(path))
      end

      body
    end

    def prepare_url_params(path, params = {})
      url = "#{@endpoint_url}#{path}"

      if @api_version == 'v2'
        full_params = params.merge(get_auth_params(path))
        return "#{@endpoint_url}#{path}?#{URI.encode_www_form(full_params)}"
      end

      url
    end

    def headers_request(path, body_to_send = {})
      if @api_version == 'v2'
        { 'Content-Type': 'application/json' }
      else
        { 'Content-Type': 'application/json', 'Authorization': Auth1.generate_authorization(path, body_to_send, @endpoint_url, @partner_key)[:ok] }
      end
    end
  end
end
