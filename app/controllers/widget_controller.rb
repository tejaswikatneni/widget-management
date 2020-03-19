class WidgetController < ApplicationController
  before_action :authenticate_user!, :check_refresh_token

  def index
    response = ManageWidget.new.list_visible_widgets(@access_token)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      widgets = response['data']['widgets']
      @widgets = Kaminari.paginate_array(widgets).page(params[:page]).per(10)
    end
  end

  def my_widgets
    response = ManageWidget.new.list_user_widgets(@access_token)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      widgets = response['data']['widgets']
      @widgets = Kaminari.paginate_array(widgets).page(params[:page]).per(10)
    end
  end

  def new; end

  def create
    widget = { name: widget_params['name'], description: widget_params['description'], kind: widget_params['kind'] }
    payload = { widget: widget }
    response = ManageWidget.new.create_widget(@access_token, payload)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      redirect_to widget_my_widgets_path
    else
      flash[:error] = 'There is an error on widget creation.'
      render 'new'
    end
  end

  def edit;end

  def update
    widget = { name: widget_params['name'], description: widget_params['description'] }
    payload = { widget: widget }
    action = "widgets/#{params[:id]}"
    response = ManageWidget.new.update_widget(@access_token, payload, action)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      redirect_to widget_my_widgets_path
    else
      flash[:error] = 'There is an error on widget creation.'
      render 'edit'
    end
  end

  def destroy
    action = "widgets/#{params[:id]}"
    response = ManageWidget.new.destroy_widget(@access_token, action)
    response = JSON.parse(response.body)
    if response.present? && (response['message'] == 'Success')
      redirect_to widget_my_widgets_path
    end
  end

  private

  def check_refresh_token
    current_user.refresh_auth_token
    @access_token = current_user.access_token
  end

  def widget_update_params
    params.permit(:name, :description)
  end

  def widget_params
    params.permit(:name, :description, :kind)
  end
end
