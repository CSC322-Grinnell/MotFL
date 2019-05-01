class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  #catching access denied exception
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_url, notice: "Access Denied"
  end

end
