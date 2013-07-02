require File.dirname(__FILE__) + '/../../config/environment'
class UsersService
    def get_users
      @users = User.all
      return @users
    end
end

