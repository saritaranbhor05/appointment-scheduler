class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource
  before_filter :set_no_cache

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def layout_by_resource
    if devise_controller?
      'application'
    else
      'site_navigation'
    end
  end

  # As there is no such home page, after sign_out
  # override the home_path to 'users/sign_in'
  def after_sign_out_path_for(resource_or_scope)
    home_path = '/users/sign_in'
    home_path
  end

  def after_sign_in_path_for(resource_or_scope)
    session[:previous_url].blank? ? root_url : session[:previous_url]
  end

  def set_no_cache
    response.headers['Cache-Control'] =
      'no-cache, no-store, max-age=0, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Thur, 05 Mar 2015 00:00:00 GMT'
  end
end
