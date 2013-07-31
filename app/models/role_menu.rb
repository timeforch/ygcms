class RoleMenu < ActiveRecord::Base
  attr_accessible :menu_id, :role_id
  belongs_to :menu
  belongs_to :role
end
