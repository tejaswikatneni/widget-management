class WidgetController < ApplicationController
  before_action :authenticate_user!, :check_refresh_token

  def index
    response = ManageWidget.new.list_visible_widgets(@access_token)
    response = JSON.parse(response.body)
    if response.present?
      widgets = response['data']['widgets']
      @widgets = Kaminari.paginate_array(widgets).page(params[:page]).per(10)
    end
  end

  def my_widgets
    response = ManageWidget.new.list_user_widgets(@access_token)
    response = JSON.parse(response.body)
    if response.present?
      widgets = response['data']['widgets']
      @widgets = Kaminari.paginate_array(widgets).page(params[:page]).per(10)
    end
  end

  def check_refresh_token
    current_user.refresh_auth_token
    @access_token = current_user.access_token
  end
end
