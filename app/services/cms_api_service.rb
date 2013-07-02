require File.expand_path('../users_service', __FILE__)

class CmsApiService
  def initialize()
    @log = {}
  end

  def getAllUsers
     user_service  = UsersService.new
    return convert_model_to_vo(user_service.get_users)
  end

  def getUserCount
    return 20
  end





  def convert_model_to_vo(users)
    users_vo = []
    users.each do |user|
      vo = UserVo.new
      vo.login_name = user.login_name
      vo.user_name = user.user_name
      vo.password = user.password
      vo.enabled = user.enabled
      vo.phone_number = user.phone_number
      users_vo << vo
    end
    return users_vo
  end

end

CmsApiService.new.getAllUsers

