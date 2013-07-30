#encoding:utf-8
class Role < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :name ,:sid
  validates :sid,presence:{message:"主键不能为空！"}
  validates :name,presence: {message:"角色名称不能为空"}
  has_many :user_roles
  has_many :users, through: :user_roles
end
