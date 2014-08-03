class ApplicationController < ActionController::Base
  require 'casclient'
  require 'casclient/frameworks/rails/filter'

  #before_filter RubyCAS::Filter

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= Climber.find_by_login(session[:cas_user])
    if @current_user.nil?
      return Climber.guest
    end
    @current_user
  end


end
