

package "httpd" do 
    action :install
end

service "httpd" do
    action [:enable, :start]
end

node["lamp-stack"]["sites"].each do |sitename, data|
    document_root = "/var/www/html/#{sitename}"
    
    directory document_root do
    mode "0755"
    recursive true
    end
    
    template "/etc/httpd/conf/httpd.conf" do
    source "httpd.conf.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"],
      :servername => data["servername"]
    )
    notifies :restart, "service[httpd]", :immediately
    end
end