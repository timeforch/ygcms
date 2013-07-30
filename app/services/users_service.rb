require File.dirname(__FILE__) + '/../../config/environment'
class UsersService
    def get_users(page_no,page_size)
      @users = User.paginate(page:page_no,per_page:page_size).order('id DESC')
      return @users
    end

   def get_count
     User.count()
   end
end

