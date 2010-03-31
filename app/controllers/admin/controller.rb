require 'digest'
class Admin::Controller < ApplicationController
  layout 'admin'
  before_filter :authenticate

  private
   def authenticate
     authenticate_or_request_with_http_basic do |username, password|
       encrypted_password = Digest::MD5.hexdigest(password)
       username == Settings[:admin_username] && encrypted_password == Settings[:admin_password_hash]
     end
  end
end