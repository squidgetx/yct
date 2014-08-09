class ApplicationController < ActionController::Base
  #before_filter RubyCAS::Filter
  before_filter CASClient::Frameworks::Rails::GatewayFilter
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:cas_user].nil?
    @current_user ||= Climber.find_by_login(session[:cas_user])
    if @current_user.nil?
      return Climber.guest
    end
    @current_user

  end


end
