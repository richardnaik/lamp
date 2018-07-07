# enable the ius yum repo
remote_file '/tmp/ius-release.rpm' do
  source 'https://centos7.iuscommunity.org/ius-release.rpm'
end

yum_package 'ius-release' do
  source '/tmp/ius-release.rpm'
end

# install php packages
yum_package 'php72u-common'
yum_package 'php72u-fpm'
yum_package 'php72u-opcache'
yum_package 'php72u-mysqlnd'
yum_package 'php72u-cli'
yum_package 'php72u-intl'
yum_package 'php72u-pdo'
yum_package 'php72u-gd'
yum_package 'php72u-json'
yum_package 'php72u-pecl-xdebug'
yum_package 'php72u-xml'
yum_package 'php72u-xmlrpc'
#yum_package 'php72u-mcrypt'
yum_package 'php72u-mbstring'

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

# install composer
remote_file '/usr/bin/composer' do
  source 'https://getcomposer.org/composer.phar'
  mode 0755
  not_if { ::File.exist?('/usr/bin/composer.phar') }
end
