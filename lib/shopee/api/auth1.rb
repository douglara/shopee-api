require "openssl"

module Auth1
  def self.build_auth_url(endpoint_url, partner_id, partner_key, redirect_url)
    path = '/api/v1/shop/auth_partner'

    token = calculate_token(redirect_url, partner_key)

    url = "#{endpoint_url}#{path}?id=#{partner_id}&token=#{token}&redirect=#{redirect_url}"
    return { ok: url }
  end

  def self.generate_authorization(path, data, endpoint_url, partner_key)
    message = "#{endpoint_url}#{path}|#{data}"
    {ok: OpenSSL::HMAC.hexdigest("SHA256", partner_key, message) }
  end

  private

  def self.calculate_token(redirect_url, partner_key)
    base_string = "#{partner_key}#{redirect_url}"
    Digest::SHA256.hexdigest(base_string)
  end
end
