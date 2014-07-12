class ApplicationController < ActionController::Base
  require 'casclient'
  require 'casclient/frameworks/rails/filter'

  #before_filter RubyCAS::Filter

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user = Climber.find_by_netid(session[:cas_user])
  end


end
