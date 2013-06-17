#!/usr/bin/env ruby
# encoding: utf-8
require 'singleton'
require 'singleton'
require 'yaml'
require 'rails'
module CommonTools
  class Config
    include Singleton
    def get_config(file_name = "config.yml")
      #Rails.root在此处读不到所以自己组装了一个获取配置文件的路径
      @config_path = Pathname.new(__FILE__).parent.parent.parent
      #夹载配置文件   "#{config_path}/config/services.yml"
      YAML.load(File.read("#{@config_path}/config/#{file_name}")) [Rails.env.to_s]
    end
  end
end
