### installing wp cli
bash "wpcli setup" do
    user 'root'
    cwd  '/tmp'
    code <<-EOH
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    mv  wp-cli.phar  /usr/local/bin/
    chmod +x /usr/local/bin/wp-cli.phar    
    ln -s /usr/local/bin/wp-cli.phar /usr/bin/wp
    EOH
    not_if { ::File.exists?('/usr/local/bin/wp-cli.phar') }
end
