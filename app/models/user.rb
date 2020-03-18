# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_user_on_api, :create_auth_token

  def create_user_on_api
  	#todo
  end

  def create_auth_token
  	#todo
  end
end
