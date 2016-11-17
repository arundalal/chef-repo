# Setting up apache

package "httpd" do
    action :install
end

service "httpd" do
    action [:nothing, :start, :enable]
end