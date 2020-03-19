class ManageWidget < UrlAccess
  def list_visible_widgets(access_token, term)
    endpoint = endpoint_get_url('widgets/visible', term)
    headers = fetch_headers(access_token)
    request_get_api(endpoint, headers)
  end

  def list_user_widgets(access_token, term)
    endpoint = endpoint_get_url('users/me/widgets', term)
    headers = fetch_headers(access_token)
    request_get_api(endpoint, headers)
  end

  def create_widget(access_token, payload)
    endpoint = endpoint_url('widgets')
    headers = fetch_headers(access_token)
    request_post_api(endpoint, payload, headers)
  end

  def update_widget(access_token, payload, action)
    endpoint = endpoint_url(action)
    headers = fetch_headers(access_token)
    request_put_api(endpoint, payload, headers)
  end

  def destroy_widget(access_token, action)
    endpoint = endpoint_url(action)
    headers = fetch_headers(access_token)
    request_del_api(endpoint, headers)
  end
end
