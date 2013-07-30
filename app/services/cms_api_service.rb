require File.expand_path('../users_service', __FILE__)
require File.expand_path('../my_object', __FILE__)

class CmsApiService
  def initialize()
    @log = {}
  end

  def getAllUsers
     user_service  = UsersService.new
    return convert_model_to_vo("UserVo",user_service.get_users(1,getUserCount))
  end

  def getUserCount
    return user_service.get_count
  end





  def convert_model_to_vo(targetClassName,users)
    obj = Object.const_get(targetClassName)
     props = get_attr(obj)
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

  def get_attr(targetClass)
    arrs = []
    targetClass::FIELDS.each_value.each do |map|
      arrs << map[:name]
    end
    return arrs
  end

end

CmsApiService.new.getAllUsers

