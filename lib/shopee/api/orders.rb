module Orders
  def get_order()
  end

  def get_orders()
    path = '/api/v1/orders/basics'
    body = {}
    request_result = post_request(path, body)
    puts(request_result)
    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
