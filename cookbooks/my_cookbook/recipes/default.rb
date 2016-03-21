#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef_client'
include_recipe 'ntp'
include_recipe 'apt'

template '/tmp/greeting.txt' do
  variables greeting: 'Hello!'
end


template '/tmp/greeting.txt' do
  variables greeting: 'bye!'
end