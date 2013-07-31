#encoding:utf-8
class Menu < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :click_url, :display, :name, :parent_path, :sid
  validates :sid,presence:{message:"主键不能为空！"}
  has_many :role_menus
  has_many :roles,through: :role_menus

  has_many :operations


end
