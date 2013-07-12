$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'
require File.expand_path('../cms_api_service', __FILE__)

begin
  handler = CmsApiService.new

  processor = ICMSApi::Processor.new(handler)
  transport = Thrift::ServerSocket.new('192.168.211.25', 9090)
#transport = Thrift::NonblockingServer.new(transport)
  tFactory = Thrift::FramedTransportFactory.new()
  pFactory = Thrift::BinaryProtocolFactory.new()
  server = Thrift::NonblockingServer.new(processor, transport, tFactory, pFactory)

  puts "Starting the server..."
  server.serve()
  puts "done."
rescue
  puts "error:#{$!} at:#{$@}"
end

