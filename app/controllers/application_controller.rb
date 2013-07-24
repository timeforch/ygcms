class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def get_sid
    return UUIDTools::UUID.random_create.to_s.gsub('-','')
  end
end
