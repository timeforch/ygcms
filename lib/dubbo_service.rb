#!/usr/bin/env ruby
# encoding: utf-8
#提供dubboservice

require File.expand_path('../hessian_proxy', __FILE__)

class DubboService
    include Singleton
    GetFullCommodityPageUrl = 'getFullCommodityPageUrl'

    def initialize
      @@cmsApi = HessianProxy.new.get_proxy("com.yougou.cms.api.ICMSApi")
    end


    def exec(method_name, *params)
      @@cmsApi.send(method_name,*params)
    end

end

if __FILE__ == $0
  puts DubboService.methods
  puts DubboService.instance.exec(DubboService::GetFullCommodityPageUrl, '99821137')
end