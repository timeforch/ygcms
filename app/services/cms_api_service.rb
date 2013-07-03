require File.expand_path('../users_service', __FILE__)
require File.expand_path('../my_object', __FILE__)

class CmsApiService
  def initialize()
    @log = {}
  end

  def getAllUsers
     user_service  = UsersService.new
    return convert_model_to_vo("UserVo",user_service.get_users)
  end

  def getUserCount
    return 20
  end





  def convert_model_to_vo(targetClassName,users)
    obj = Object.const_get(targetClassName)
     props = obj.new.get_attr
    users_vo = []
    users.each do |user|
      vo = obj.new
      props.each do |prop|
        obj.class_eval("vo.#{prop} = user.#{prop}")
      end
      users_vo << vo
    end
    return users_vo
  end

end

CmsApiService.new.getAllUsers

