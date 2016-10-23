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
yum_package 'php70u-common'
yum_package 'php70u-devel'
yum_package 'php70u-fpm'
yum_package 'php70u-opcache'
yum_package 'php70u-mysqlnd'
yum_package 'php70u-cli'
yum_package 'php70u-intl'
yum_package 'php70u-pdo'
yum_package 'php70u-gd'
yum_package 'php70u-json'
yum_package 'php70u-pecl-xdebug'

# create apache conf file to handle fpm proxy
template '/etc/httpd/conf.d/php.conf' do
  source 'php.conf.erb'
  mode '0755'
  action :create
end

# start php-fpm service
service 'php-fpm' do
  action [:enable, :start]
end

# restart apache
service 'httpd' do
  action [:restart]
end
