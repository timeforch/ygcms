class User < ActiveRecord::Base
  attr_accessible :enabled, :login_name, :password, :phone_number, :user_name
  has_many :user_roles
  has_many :roles, through: :user_roles
end



