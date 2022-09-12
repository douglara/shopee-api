module Orders
  def get_order(order_id)
    if @api_version == 'v1'
      return v1_get_order(order_id)
    else
      return v2_get_order(order_id)
    end
  end

  def get_orders(params={})
    if @api_version == 'v1'
      return v1_get_oders(params)
    else
      return v2_get_oders(params)
    end
  end

  private

  def v2_get_order(order_id, params = {})
    path = '/api/v2/order/get_order_detail'
    new_params = {
      'order_sn_list': [order_id.to_s],
    }.merge(params)

    request_result = get_request(path, new_params)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def v1_get_order(order_id)
    path = '/api/v1/orders/detail'
    body = {'ordersn_list': [order_id.to_s]}
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end
  
  def v1_get_oders(params)
    path = '/api/v1/orders/get'
    body = {'order_status': 'ALL'}.merge(params)
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def v2_get_oders(params)
    path = '/api/v2/order/get_order_list'
    new_params = {
      'time_range_field': 'create_time',
      'time_to': Time.now.getutc.to_i,
      'time_from': (Time.now - 14).getutc.to_i,
      'page_size': 100
    }.merge(params)

    request_result = get_request(path, new_params)

    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
