class Menu < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :click_url, :display, :name, :parent_path, :sid
end
