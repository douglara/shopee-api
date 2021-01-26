module Logistics
  def init_logistic(order_id, type)
    path = '/api/v1/logistics/init'
    body = {'ordersn': order_id}.merge(type)
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def init_logistic_with_dropoff(order_id)
    logistic_type = {'dropoff': {}, 'info_needed': ['dropoff': ['tracking_no']]}
    init_logistic(order_id, logistic_type)
  end

  def get_parameter_for_init(order_id)
    path = '/api/v1/logistics/init_parameter/get'
    body = {'ordersn': order_id}
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def get_logistic_info(order_id)
    path = '/api/v1/logistics/init_info/get'
    body = {'ordersn': order_id}
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def get_branch(order_id)
    path = '/api/v1/logistics/branch/get'
    body = {'ordersn': order_id}
    request_result = post_request(path, body)

    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
