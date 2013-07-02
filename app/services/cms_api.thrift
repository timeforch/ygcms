struct User{
    1: string login_name,
    2: string user_name,
    3: string phone_number,
    4: string password,
    5: bool   enabled
}

service ICMSApi{

    i32 getUserCount(),
    list<User> getAllUsers()
    User getUserByLoginName(1: string loginName)

}