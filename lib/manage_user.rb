class ManageUser < UrlAccess
  def register_users(payload)
    endpoint = endpoint_url('users')
    payload = payload
    headers = { "Content_Type": 'application/json' }
    request_post_api(endpoint, payload, headers)
  end
end
