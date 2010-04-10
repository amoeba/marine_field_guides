class Admin::AdminController < ApplicationController
  before_filter :login_required
  
  protected
  def login_required
    authenticate_or_request_with_http_basic do |user_name, password|
      password == 'darwin'
    end if RAILS_ENV == 'production' || params[:admin_http]
  end
end