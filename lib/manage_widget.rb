class ManageWidget < UrlAccess
  def list_visible_widgets(access_token)
    endpoint = endpoint_get_url('widgets/visible')
    headers = fetch_headers(access_token)
    request_get_api(endpoint, headers)
  end

  def list_user_widgets(access_token)
  	endpoint = endpoint_get_url('users/me/widgets')
    headers = fetch_headers(access_token)
    request_get_api(endpoint, headers)
  end
end
