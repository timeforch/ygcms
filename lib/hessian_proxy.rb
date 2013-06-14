#!/usr/bin/env ruby
# encoding: utf-8

require 'hessian2'
require 'redis'
require 'json'
require "#{Pathname.new(__FILE__).parent}/zookeeper/common_tools"
class HessianProxy
  include CommonTools

  def initialize
    @redis = Redis.new(:host => CommonTools::Config.instance.get_config["redis.host"], :port => CommonTools::Config.instance.get_config["redis.port"])
  end

  def get_proxy(service = "")
    list = JSON.parse(@redis.get(service))
    if list.empty?
      raise "no provider for service :#{service} be found !"
    end
     url = list[rand(list.size)].gsub("hessian","http").split("?")[0]
    puts url
     Hessian2::HessianClient.new(url)
  end
end

if __FILE__ == $0
  puts HessianProxy.new.get_proxy("com.yougou.cms.api.ICMSApi")
end