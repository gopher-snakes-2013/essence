class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery
  before_filter :authorize

end
