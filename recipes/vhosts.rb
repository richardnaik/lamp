# create apache vhost directories
directory '/etc/httpd/sites-available' do
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end

directory '/etc/httpd/sites-enabled' do
  owner 'apache'
  group 'apache'
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
  notifies :restart, "service[httpd]", :immediately
end
