name "german_hosts"
description "This role contains hosts, which should print message in german"
run_list "recipe[my_cookbook]"
default_attributes "my_cookbook" => {"message" => "Hallo Welt"}


