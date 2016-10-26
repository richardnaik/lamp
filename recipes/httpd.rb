# install httpd package
yum_package 'httpd'

# create web roots
directory '/var/www' do
  owner 'apache'
  group 'apache'
  mode '0755'
  recursive true
  action :create
end

# install and enable the ssl module
yum_package 'mod_ssl'

# start and enable the service
service 'httpd' do
  action [:enable, :start]
end
