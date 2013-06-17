#!/usr/bin/env ruby
# encoding: utf-8
#提供dubboservice
require File.expand_path('../hessian_proxy', __FILE__)
module DubboService
  class CMSApi
    include Singleton

    def initialize
      @cmsApi = HessianProxy.new.get_proxy("com.yougou.cms.api.ICMSApi")
    end

    def get_full_commodity_page_url(commodity_no = "")

      if commodity_no.empty?
        return ""
      end

      url = @cmsApi.getFullCommodityPageUrl(commodity_no)
      return url ||= ""
    end

  end
end

if __FILE__ == $0
  puts DubboService::CMSApi.instance.get_full_commodity_page_url
end