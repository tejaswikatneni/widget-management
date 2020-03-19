class WidgetController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	User.last.refresh_auth_token
  end
end
