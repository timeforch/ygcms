class UserService
    def get_users
      @users = User.all
      puts @users
      return @users
    end
end