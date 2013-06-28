# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#attr_accessible :enabled, :login_name, :password, :phone_number, :user_name
User.create({user_name:'minxiaorong',
			 login_name:'min.xr',
			 password:'pwd',
			 phone_number:'13444444444',
			 enabled:false})
User.create({user_name:'tanfeng',
			 login_name:'tan.f',
			 password:'pwd',
			 phone_number:'13444444444',
			 enabled:false})
