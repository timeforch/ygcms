class Operation < ActiveRecord::Base
  self.primary_key = "sid"
  attr_accessible :action_name, :sid, :url
end
