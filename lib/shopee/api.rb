require "shopee/version"
require "shopee/http"
require_relative "api/oauth"

module Shopee
  class Api
    include Shopee::Http
    include Oauth

    def initialize(params)
      [:partner_id, :partner_key, :redirect_uri, :shopid].each do |field|
        raise ArgumentError if (params[field.to_sym] == nil or params[field.to_sym].empty?)
      end

      { production: false }.merge(params)
      @partner_id = params[:partner_id]
      @partner_key = params[:partner_key]
      @redirect_uri = params[:redirect_uri]
      @shopid = params[:shopid]
      @production = params[:production]

      if @production == false
        @endpoint_url = "https://partner.uat.shopeemobile.com/api/v2"
      else
        @endpoint_url = "https://partner.shopeemobile.com/api/v2"
      end
    end
  end
end
