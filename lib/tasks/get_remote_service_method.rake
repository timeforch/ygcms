#!/usr/bin/env ruby
# encoding: utf-8
require File.expand_path('../../../lib/dubbo_service', __FILE__)
require 'redis'
require 'json'
require 'uri'
require 'cgi'

task :methods, [:interface] => :sync_service_to_redis do |t, args|
  redis = Redis.new(:host => CommonTools::Config.instance.get_config["redis.host"],
                    :port => CommonTools::Config.instance.get_config["redis.port"])
  interface_name = args[:interface]
  service_json = redis.get(interface_name)
  list = JSON.parse(service_json ||= "[]")
  if list.empty?
    puts "没有找到#{interface_name}的hessian接口，请先执行 [rake sync_service_to_redis]！"
  end
  uri = URI.parse(list[0])
  #puts uri.query
  all_methods =  CGI::parse(uri.query)["methods"][0].split(',')
  puts """接口#{interface_name}拥有以下方法可以供您调用:(#{all_methods.size})"""

  all_methods.each do |method|
        puts method
  end


end