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

ENV['MESSAGE'] = 'Hello WOrld from Chef Recipe'

execute 'Print value to envar $MEAASAGE' do
  command 'echo $MESSAGE > /tmp/message2'
end

max_mem = node['memory']['total'].to_i * 0.8

execute 'Print total memory' do
  command "echo #{max_mem} > /tmp/maxmem"
end

#node.override['my_cookbook']['version']='0.1.2'
execute 'Version att overide' do
  command "echo #{node['my_cookbook']['version']}"
end

server = search(:node, "platform:amazon")

server.each do |srv|
  log srv.name
end

hook = data_bag_item('hooks','request_bin')
http_request 'callback' do
  url hook['url']
end