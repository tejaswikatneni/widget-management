# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_user_on_api
  after_update :update_user_on_api

  def create_user_on_api
    user_params = { first_name: first_name, last_name: last_name, email: email, password: password, image_url: image_url }
    payload = { client_id: ENV['client_id'], client_secret: ENV['client_secret'], "user": user_params }.to_json
    response = ManageUser.new.register_users(payload)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      response_data = response['data']['token']
      update_user_auth(response_data)
    end
  end

  def update_user_on_api
    user_params = { first_name: first_name, last_name: last_name, image_url: image_url }
    payload = { "user": user_params }.to_json
    refresh_auth_token
    ManageUser.new.update_user(payload, access_token)
  end

  def refresh_auth_token
    if token_expired_at.to_time < Time.now
      response = UrlAccess.new.refresh_token(access_token, refresh_token)
      if response.present? && (response['message'] == 'Success')
        response_data = response['data']['token']
        update_user_auth(response_data)
      end
    end
  end

  def update_user_auth(response_data)
    access_token = response_data['access_token']
    refresh_token = response_data['refresh_token']
    expires_in = response_data['expires_in']
    token_created_at = response_data['created_at']
    token_expiry_date = UrlAccess.new.cal_expiry_date(token_created_at, expires_in)
    update(access_token: access_token, refresh_token: refresh_token, token_expired_at: token_expiry_date)
  end
end
