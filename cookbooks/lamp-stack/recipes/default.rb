#
# Cookbook Name:: lamp-stack
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
if platform_family?('rhel')
    execute "yum-update" do
        command "yum update -y"
        action :nothing
    end
    
    execute "yum clean all" do
        command "yum clean all"
        notifies :run, 'execute[yum-update]', :immediately
    end
end

include_recipe 'lamp-stack::apache'