module Items
  def get_items()
    path = '/api/v1/items/get'
    body = { 'pagination_offset': 0, 'pagination_entries_per_page': 100 }

    request_result = post_request(path, body)
    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
