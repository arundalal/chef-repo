#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/tmp/message' do
  source 'message.erb'
  variables(
    hi: 'Halloooo',
    world: 'Weelllt',
    from: node['ipaddress']
  )
end