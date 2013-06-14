#!/usr/bin/env ruby
# encoding: utf-8
#dubbo 注册中心工厂类
require 'zookeeper'
require 'singleton'
require 'yaml'
require 'rails'
require "#{File.dirname(__FILE__)}/common_tools"
class RegistryFactory
  include Singleton
  include CommonTools

  def initialize
    config = CommonTools::Config.instance.get_config
    @zk = Zookeeper.new("#{config['service.zookeeper.address']}:#{config['service.zookeeper.port']}")
  end

  def get_all_dubbo_config(path=dobbo_root)
    @zk.get_children(path: "#{path}")
  end

  def  dobbo_root
    return "/dubbo"
  end

end

if __FILE__ == $0
  factory = RegistryFactory.instance


  factory.get_all_dubbo_config[:children].each do |config|
    puts config
  end

  puts CommonTools::Config.instance.get_config["service.interface.list"].size
end



