#encoding:utf-8
class User < ActiveRecord::Base
  attr_accessible :enabled, :login_name, :password, :phone_number, :user_name
  validates :login_name,  length: {minimum: 3, message: "登陆名最少三个字符"}
  validates :login_name, uniqueness: {message: '该名称已经被使用，请更换一个！', case_sensitive: false},
            :format => {:with => /^[a-zA-Z](\.?)(\w*\d*)/ ,:message => "登陆名只能以字母开头，由数组和字母组成"}
  validates :phone_number,length: {minimum: 11,maximum: 11,message:"电话长度应为11位：例如01012345678或13512345678"}
  validates :password,
            length: {
                maximum: 12,
                minimum: 6,
                message: "密码长度为6--12个字符"
            }
  has_many :user_roles
  has_many :roles, through: :user_roles
end



