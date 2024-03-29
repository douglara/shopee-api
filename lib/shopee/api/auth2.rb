require "openssl"

module Auth2
  def build_auth_url()
    timest = Time.now.getutc.to_i
    path = "/api/v2/shop/auth_partner"
    base_string = "#{@partner_id}#{path}#{timest}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    url = "#{@endpoint_url}#{path}?partner_id=#{@partner_id}&timestamp=#{timest}&sign=#{sign}&redirect=#{@redirect_uri}"
    return{ :ok => url }
  end

  def get_auth_params(path)
    timest = Time.now.getutc.to_i

    {
      'partner_id': "#{@partner_id}",
      'access_token': "#{@access_token}",
      'shop_id': @shopid,
      'sign': get_logged_sign(path, timest), 
      'timestamp': timest 
    }
  end

  def get_logged_sign(path, timest = Time.now.getutc.to_i)
    base_string = "#{@partner_id}#{path}#{timest}#{@access_token}#{@shopid}"
    OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
  end

  def get_access_token(auth_code)
    timest = Time.now.getutc.to_i
    body = { "code": auth_code, "shop_id": @shopid.to_i, "partner_id": @partner_id }
    path = '/api/v2/auth/token/get'
    base_string = "#{@partner_id}#{path}#{timest}#{@shopid}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    path_url = "#{path}?partner_id=#{@partner_id}&shop_id=#{@shopid}&sign=#{sign}&timestamp=#{timest}"

    request_result = public_post_request(path_url, body)
    response = JSON.parse(request_result.body)

    if (response.key?("access_token"))
      return { ok: response }
    else
      return { error: response }
    end
  end

  def refresh_token(refresh_token)
    timest = Time.now.getutc.to_i
    body = { "shop_id": @shopid, "refresh_token": refresh_token, "partner_id": @partner_id }
    path = "/api/v2/auth/access_token/get"
    base_string = "#{@partner_id}#{path}#{timest}#{@shopid}"
    sign = OpenSSL::HMAC.hexdigest("SHA256", @partner_key, base_string)
    path_url = "#{path}?partner_id=#{@partner_id}&shop_id=#{@shopid}&sign=#{sign}&timestamp=#{timest}"

    request_result = public_post_request(path_url, body)
    response = JSON.parse(request_result.body)

    if (response.key?("access_token"))
      return { ok: response }
    else
      return { error: response }
    end
  end
end
