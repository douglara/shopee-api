require "httparty"

module Shopee
  module Http
    def post_request(path, params = {})
      response = HTTParty.post("#{@endpoint_url}#{path}",
                               :headers => headers_request(),
                               :body => params.to_json)
    end

    private

    def headers_request()
      { "Content-Type": "application/json" }
      #"Authorization": ""
    end
  end
end
