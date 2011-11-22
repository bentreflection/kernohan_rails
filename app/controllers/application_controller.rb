# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  layout 'application'
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery # :secret => '9fc18df55e82fdcd7025198adf07f8f0'
  
  before_filter :get_contact_info
  
  
  
  
  def get_contact_info
    @contact_info = ContactInfo.find_or_create_by_slug('contact')
  end
  
  def render_optional_error_file(status_code)
    if File.exists?(File.join(RAILS_ROOT, "app", "views", "pages", "#{status_code}.html.haml"))
      render :template => "pages/#{status_code}", :status => status_code and return
    else
      super
    end
  end
  
  
  
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  # Standardizes flash messaging across the application, types are:
  #
  # * +error+: for error responses on an action
  #     i.e. "unable to update your account, please try again"
  # * +success+: for successful completion of an action
  #     i.e. "your billing information has been updated"
  # * +notice+: for important notices to the user
  #     i.e. "your subscription will expire soon"
  # * +info+: for helpful info to the user
  #     i.e. "you have 3 new messsages"
  #
  # Usage:
  #     messages(:info) << "you have 3 new messages"
  #     messages(:info) => ["you have 3 new messages"]
  def messages(type, now=false)
    raise "Unacceptable message type #{type}" unless [ :error, :success, :notice, :info ].include?(type)
    now ? (flash.now[type] ||= []) : (flash[type] ||= [])
  end
  helper_method :messages

  # Use to put all the full error messages from the given object onto the
  # error message stack.
  #
  # +message+ is an optional message to prepend to the collection of error
  # messages.
  #
  # i.e.
  #     errors_for(@user, "Unable to save your account: ")
  def errors_for(object, message=nil, now=false)
    messages(:error, now) << message if message
    messages_for(object, :error, nil, now)
  end

  def messages_for(object, level, method=nil, now=false)
    method ||= level.to_s.pluralize.to_sym
    objects = object.is_a?(Array) ? object : [object]
    objects.each{ |o| o.send(method).full_messages.each{ |msg| messages(level, now) << msg } }
  end
  
end
