#ygcms

=====
dependency:

gem 'zookeeper'

=====
if you first time to run this project ,you need to do the list steps

0. bundle install  => to install dependency bundle, if not successful please check and fix it

1. rake db:create  => to create database for your project

2. rake db:migrate => to create table for your project

3. rake sync_service_to_redis => to sync provider to redis

4. rake methods => to list all methods of remote api ,need param,use demo:rake methods['com.yougou.cms.api.ICMSApi']

5. you can run startup.sh to start app on 9080 port,or you can run command :rails s to start app on port 3000 directly
------
Extjs4.2.1 with Rails3

rake g scaffold user login_name:string user_name:string password:string enabled:boolean phone_number:string



