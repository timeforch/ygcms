#
# Autogenerated by Thrift Compiler (0.9.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

class UserVo
  include ::Thrift::Struct, ::Thrift::Struct_Union
  LOGIN_NAME = 1
  USER_NAME = 2
  PHONE_NUMBER = 3
  PASSWORD = 4
  ENABLED = 5

  FIELDS = {
    LOGIN_NAME => {:type => ::Thrift::Types::STRING, :name => 'login_name'},
    USER_NAME => {:type => ::Thrift::Types::STRING, :name => 'user_name'},
    PHONE_NUMBER => {:type => ::Thrift::Types::STRING, :name => 'phone_number'},
    PASSWORD => {:type => ::Thrift::Types::STRING, :name => 'password'},
    ENABLED => {:type => ::Thrift::Types::BOOL, :name => 'enabled'}
  }

  def struct_fields; FIELDS; end

  def validate
  end

  ::Thrift::Struct.generate_accessors self
end
