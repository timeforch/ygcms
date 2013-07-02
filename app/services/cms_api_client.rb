$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'


  port = ARGV[0] || 9090

  transport = Thrift::FramedTransport.new(Thrift::Socket.new('localhost', port))
  transport.open()
  protocol = Thrift::BinaryProtocol.new(transport)
  client = ICMSApi::Client.new(protocol)
  start = Time.now
  (1..10000).each do|i|
  puts "the #{i} times invoke "
  puts "beofre"
  puts client.getUserCount
  puts client.getAllUsers
  puts 'after'
  end
  transport.close()
end_time = Time.now - start
puts end_time




