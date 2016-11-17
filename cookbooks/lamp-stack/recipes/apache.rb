

package "httpd" do 
    action :install
end

service "httpd" do
    action [:enable, :start]
end

data_bag("sites").each do |sitename|
    document_root = "/var/www/#{sitename}"
    
    directory document_root do
    mode "0755"
    recursive true
    end
end    
#template "/etc/httpd/conf/httpd.conf" do
#    source "httpd.conf.erb"
#    mode "0644"
#    variables({
#      :sites_data => node["lamp-stack"]["sites"]
#    })
#    notifies :restart, "service[httpd]", :immediately
#end


template "/etc/httpd/conf/httpd.conf" do
    source "httpd.conf.erb"
    mode "0644"
    variables({
      :sites_name => data_bag('sites')
    })
    notifies :restart, "service[httpd]", :immediately
end


