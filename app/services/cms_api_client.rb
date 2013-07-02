$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'


  port = ARGV[0] || 9090

  transport = Thrift::FramedTransport.new(Thrift::Socket.new('localhost', port))
  protocol = Thrift::BinaryProtocol.new(transport)
  client = ICMSApi::Client.new(protocol)
  transport.open()
  puts "beofre"
  puts client.getUserCount
  puts client.getAllUsers
  puts 'after'
  transport.close()




