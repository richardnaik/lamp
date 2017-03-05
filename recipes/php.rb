# enable the epel and ius yum repos
yum_package 'epel-release'

remote_file '/root/setup-ius.sh' do
  source 'https://setup.ius.io'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'setup-ius.sh' do
  cwd '/root'
  command './setup-ius.sh'
  action :run
end

# install php packages
yum_package 'php71u-common'
yum_package 'php71u-fpm'
yum_package 'php71u-opcache'
yum_package 'php71u-mysqlnd'
yum_package 'php71u-cli'
yum_package 'php71u-intl'
yum_package 'php71u-pdo'
yum_package 'php71u-gd'
yum_package 'php71u-json'
yum_package 'php71u-pecl-xdebug'
yum_package 'php71u-xml'
yum_package 'php71u-xmlrpc'
yum_package 'php71u-mcrypt'
yum_package 'php71u-mbstring'

# create apache conf file to handle fpm proxy
template '/etc/httpd/conf.d/php.conf' do
  source 'php.conf.erb'
  mode '0755'
  action :create
end

# start php-fpm service
service 'php-fpm' do
  action [:enable, :start]
  notifies :restart, 'service[httpd]', :immediately
end
