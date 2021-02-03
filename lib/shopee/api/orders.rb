module Orders
  def get_order(order_id)
    path = '/api/v1/orders/detail'
    body = {'ordersn_list': [order_id.to_s]}
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def get_orders(params={})
    path = '/api/v1/orders/get'
    body = {'order_status': 'ALL'}.merge(params)
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
