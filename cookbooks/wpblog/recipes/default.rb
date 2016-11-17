#
# Cookbook Name:: wpblog
# Recipe:: default
#
# Copyright 2016, Arun Dalal
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Setting up apache

#package "httpd" do
#    action :install
#end

#service "httpd" do
#    action [:enable, :start]
#end
include_recipe 'wpblog::apache'

#Setting up mysql server

#package "mysql-server" do
#    action :install
#    notifies :start, "service[mysqld]", :immediately
#    notifies :run, "bash[initial mysql config]", :immediately
#end
include_recipe 'wpblog::mysql'
#service "mysqld" do
#    action [:enable, :start]
    
#end

#bash "initial mysql config" do
#    user 'root'
#    code <<-EOH
#    mysqladmin password "redhat"
#    EOH
#    action :nothing
#end
include_recipe 'wpblog::php'
#installaing php
#package ['php', 'php-mysql'] do
#    action :install
#    notifies :restart, "service[httpd]", :immediately
#end    

#template "/var/www/html/info.php" do
#    source "info.php.erb"
#    mode "0644"
#end

include_recipe 'wpblog::wpcli'
### installing wp cli
#bash "wpcli setup" do
#    user 'root'
#    cwd  '/tmp'
#    code <<-EOH
#    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#    mv  wp-cli.phar  /usr/local/bin/
#    chmod +x /usr/local/bin/wp-cli.phar    
#    ln -s /usr/local/bin/wp-cli.phar
#    EOH
#    not_if { ::File.exists?('/usr/local/bin/wp-cli.phar') }
#end

###Setting wordpress
bash "wordpress setup" do
    user 'root'
    cwd '/var/www/html'
    code <<-EOH
    wp core download
    mysql -u root -p'redhat' -e "create database wpdata; grant usage on *.* to wpuser@localhost identified by 'redhat'; grant all privileges on wpdata.* to wpuser@localhost; flush privileges;"
    wp core config --dbname=wpdata --dbuser=wpuser --dbpass=redhat
    wp core install --url=http://localhost/ --title=WordPress --admin_user=admin --admin_password=redhat --admin_email=amitk123@my.com
    EOH
    
end













