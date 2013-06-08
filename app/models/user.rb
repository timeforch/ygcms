class User < ActiveRecord::Base
  attr_accessible :enabled, :login_name, :password, :phone_number, :user_name
end
