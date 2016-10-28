# install these for use in other recipes
yum_package 'git'
yum_package 'wget'

# instapp apache and php
include_recipe 'webserver::httpd'

# install phalcon and percona, if enabled
if node['httpd']['vhosts']['enabled'] == true
  include_recipe 'webserver::vhosts'
end

include_recipe 'webserver::php'

# install phalcon and percona, if enabled
if node['php']['phalcon']['enabled'] == true
  include_recipe 'webserver::phalcon'
end

if node['mysql']['enabled'] == true
  include_recipe 'webserver::percona'
end

# install other helper tools
yum_package 'vim'
yum_package 'htop'
