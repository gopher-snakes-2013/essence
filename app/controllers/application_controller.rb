class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery
  before_filter :authorize
  # before_filter :set_access_control_headers

  # def set_access_control_headers
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
  #   headers['Access-Control-Request-Method'] = '*'
  #   headers['Access-Control-Allow-Headers'] = '*'
  # end
end
