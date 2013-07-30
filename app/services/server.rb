$:.push('lib')
require 'thrift'
require 'cms_api'
require 'cms_api_types'
require 'cms_api_constants'
require File.expand_path('../cms_api_service', __FILE__)
def run_server(port)
  begin
    handler = CmsApiService.new

    processor = ICMSApi::Processor.new(handler)
    transport = Thrift::ServerSocket.new('0.0.0.0', port)
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

end
run_server(ARGV[0])
