#require "#{Pathname.new(__FILE__).parent.parent}/zookeeper/registry_factory"
require File.expand_path('../../zookeeper/registry_factory', __FILE__)
require 'redis'
require 'uri'
require 'json'
task :sync_service_to_redis => :environment do
  factory = RegistryFactory.instance
  dobbo_root = factory.dobbo_root
  used_dubbo_service = CommonTools::Config.instance.get_config["service.interface.list"]
  redis = Redis.new(:host => CommonTools::Config.instance.get_config["redis.host"], :port => CommonTools::Config.instance.get_config["redis.port"])

  used_dubbo_service.each do |service|
    #获取所有该服务所有的提供者
    providers = factory.get_all_dubbo_config("#{dobbo_root}/#{service}/providers")[:children]
    all_services = []
    providers.each do |provider|
      uri = URI.decode(provider)
      if  uri.start_with?("hessian")
        all_services <<  uri
      end
    end
    if not all_services.empty?
      redis.set  service,all_services.to_json
    else
      msg = "service: #{service} haven't any hessian provider ,please check  !"
      raise  msg
    end
  end

end
