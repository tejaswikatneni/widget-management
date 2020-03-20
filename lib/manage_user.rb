class ManageUser < UrlAccess
  def register_users(payload)
    endpoint = endpoint_url('users')
    headers = { "Content_Type": 'application/json' }
    request_post_api(endpoint, payload, headers)
  end

  def update_user(payload, access_token)
  	endpoint = endpoint_url('users/me')
  	headers = fetch_headers(access_token)
  	request_put_api(endpoint, payload, headers)
  end
end
