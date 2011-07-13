# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # Para Exception Notification
  include ExceptionNotifiable
  
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  before_filter :last_messages, :balance
  
  def last_messages
    if logged_in?
      @last_messages = Message.find(:all, :conditions => ["sent = ?", true], :order => "created_at DESC", :limit => 5)
    end
  end

  def balance
    if logged_in?
      clickatell_http = ClickatellHTTP.new(CLICKATELL_HTTP_CONFIG)
      @balance = clickatell_http.balance
    end
  end
end
