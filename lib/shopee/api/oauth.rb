require "openssl"

module Oauth
  def build_auth_url()
    timest = Time.now.getutc.to_i
    path = "/api/v2/shop/auth_partner"
    base_string = "#{@partner_id}#{path}#{timest}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    url = "#{@endpoint_url}#{path}?partner_id=#{@partner_id}&timestamp=#{timest}&sign=#{sign}&redirect=#{@redirect_uri}"
    return{ :ok => url }
  end

  def get_access_token(auth_code)
    timest = Time.now.getutc.to_i
    body = { "code": auth_code, "shop_id": @shopid, "partner_id": @partner_id }
    path = "/api/v2/auth/access_token/get"
    base_string = "#{@partner_id}#{path}#{timest}#{@shopid}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    path_url = "#{path}?partner_id=#{@partner_id}&shop_id=#{@shopid}&sign=#{sign}&timestamp=#{timest}"

    request_result = post_request(path_url, body)
    response = JSON.parse(request_result.body)

    if (response.key?("error"))
      return { error: response }
    else
      return { ok: response }
    end
  end

  def refresh_token(refresh_token)
    timest = Time.now.getutc.to_i
    body = { "shop_id": @shopid, "refresh_token": refresh_token }
    path = "/api/v2/auth/access_token/get"
    base_string = "#{@partner_id}#{path}#{timest}#{@shopid}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    path_url = "#{path}?partner_id=#{@partner_id}&shop_id=#{@shopid}&sign=#{sign}&timestamp=#{timest}"

    request_result = post_request(path_url, body)
    response = JSON.parse(request_result.body)

    if (response.key?("error"))
      return { error: response }
    else
      return { ok: response }
    end
  end
end
