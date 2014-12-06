class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  def handle_unverified_request
  	forgery_protection_strategy.new(self).handle_unverified_request
  end
end
