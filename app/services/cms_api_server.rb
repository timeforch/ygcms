$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'
require File.expand_path('../cms_api_service', __FILE__)

handler = CmsApiService.new

processor = ICMSApi::Processor.new(handler)
transport = Thrift::ServerSocket.new('localhost', 9090)
tFactory = Thrift::FramedTransportFactory.new()
pFactory = Thrift::BinaryProtocolFactory.new()
server = Thrift::ThreadPoolServer.new(processor, transport, tFactory, pFactory)

puts "Starting the server..."
server.serve()
puts "done."
