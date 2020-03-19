class ManageWidget < UrlAccess
  def list_visible_widgets(access_token)
    endpoint = endpoint_get_url('widgets/visible')
    payload = payload
    headers = fetch_headers(access_token)
    request_get_api(endpoint, headers)
  end
end