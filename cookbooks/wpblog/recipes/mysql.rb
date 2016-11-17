
package "mysql-server" do
    action :install
    notifies :start, "service[mysqld]", :immediately
    notifies :run, "bash[initial mysql config]", :immediately
end

service "mysqld" do
    action [:enable, :start]
    
end

bash "initial mysql config" do
    user 'root'
    code <<-EOH
    mysqladmin password "redhat"
    EOH
    action :nothing
end