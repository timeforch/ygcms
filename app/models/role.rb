class Role < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :name ,:sid
  has_many :user_roles
  has_many :users, through: :user_roles
end
