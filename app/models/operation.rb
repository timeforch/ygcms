#encoding:utf-8
class Operation < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :action_name, :sid, :url
  validates :sid,presence:{message:"主键不能为空！"}
  validates :action_name,length: {minimum: 2,maximum: 32,message:"操作名称应大于2个字符，小于30个字符"}
  validates :url,presence: {message:"url不能为空"}
end
