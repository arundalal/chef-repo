package ['php', 'php-mysql'] do
    action :install
    notifies :restart, "service[httpd]", :immediately
end    

template "/var/www/html/info.php" do
    source "info.php.erb"
    mode "0644"
end
