# install httpd package
yum_package 'httpd'

# create apache vhost directories
directory '/etc/httpd/sites-available' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/httpd/sites-enabled' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# create vhost directory conf file
template '/etc/httpd/conf.d/vhosts.conf' do
  source 'vhosts.conf.erb'
  mode '0755'
  action :create
end

# create example vhost file and enable it
template '/etc/httpd/sites-available/example.net.conf' do
  source 'example.net.conf.erb'
  mode '0755'
  action :create
end

link '/etc/httpd/sites-enabled/example.net.conf' do
  to '/etc/httpd/sites-available/example.net.conf'
  link_type :hard
end

# create web roots
directory '/var/www/example' do
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end

# install and enable the ssl module
yum_package 'mod_ssl'

# start and enable the service
service 'httpd' do
  action [:enable, :start]
end
