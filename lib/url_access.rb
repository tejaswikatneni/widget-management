class UrlAccess
  def cal_expiry_date(token_created_at, expires_in)
    token_created_date = Date.strptime(token_created_at.to_s, '%s')
    token_created_date + expires_in.seconds
  end

  def fetch_headers(access_token)
    { Content_Type: 'application/json', Authorization: (ENV['token_type'] + ' ' + access_token).to_s }
  end

  def refresh_token(access_token, refresh_token)
    headers = fetch_headers(access_token)
    payload = { grant_type: 'refresh_token', refresh_token: refresh_token, client_id: ENV['client_id'], client_secret: ENV['client_secret'] }
    endpoint = "#{ENV['host_url']}/oauth/token"
    request_post_api(endpoint, payload, headers)
  end

  def endpoint_url(action)
    "#{ENV['app_url']}/#{action}"
  end

  def endpoint_get_url(action)
    "#{ENV['app_url']}/#{action}?client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}"
  end

  def request_post_api(end_point, payload, headers)
    RestClient.post(end_point, payload, headers)
  end

  def request_get_api(end_point, headers)
    RestClient.get(end_point, headers)
  end

  def request_put_api(end_point, payload, headers)
    RestClient.post(end_point, payload, headers)
  end
end
