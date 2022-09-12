module Items
  def get_items()
    if @api_version == 'v1'
      return v1_get_items()
    else
      return v2_get_items()
    end
  end

  private
  
  def v1_get_items()
    path = "/api/v1/items/get"
    body = { 'pagination_offset': 0, 'pagination_entries_per_page': 100 }

    request_result = post_request(path, body)
    response = JSON.parse(request_result.body)
    { ok: response }
  end

  def v2_get_items()
    path = '/api/v2/product/get_item_list'
    params = { 'offset': 0, 'page_size': 100, 'item_status': 'NORMAL' }

    request_result = get_request(path, params)
    response = JSON.parse(request_result.body)
    { ok: response }
  end
end
