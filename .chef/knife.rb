# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "arundalal786"
client_key               "#{current_dir}/arundalal786.pem"
validation_client_name   "adalal-validator"
validation_key           "#{current_dir}/adalal-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/adalal"
cookbook_path            ["#{current_dir}/../cookbooks"]
