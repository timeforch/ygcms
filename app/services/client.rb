$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'


  port = ARGV[0] || 9898

  transport = Thrift::FramedTransport.new(Thrift::Socket.new('10.10.10.244', port))
  transport.open()
  protocol = Thrift::BinaryProtocol.new(transport)
  client = ICMSApi::Client.new(protocol)
  start = Time.now
  (1..100000).each do|i|
  puts "the #{i} times invoke "
  puts "beofre"
  puts client.getUserCount
  client.getAllUsers.each do |u|
    puts u.inspect
  end
  puts 'after'
  end
  transport.close()
end_time = Time.now - start
puts end_time




