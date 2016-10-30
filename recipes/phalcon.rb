# enabple the phalcon repo
remote_file '/root/phalcon.rpm.sh' do
  source 'https://packagecloud.io/install/repositories/phalcon/stable/script.rpm.sh'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'phalcon.rpm.sh' do
  cwd '/root'
  command './phalcon.rpm.sh'
  action :run
end

# install phalcon
yum_package 'php70u-phalcon' do
  notifies :restart, "service[php-fpm]", :immediately
  notifies :restart, "service[httpd]", :immediately
end

# pull down phalcon devtools source
git '/root/phalcon-devtools' do
  repository 'git://github.com/phalcon/phalcon-devtools.git'
  revision 'master'
  depth 1
  action :sync
end

# install devtools
bash 'install_devtools' do
  code './phalcon.sh'
  cwd '/root/phalcon-devtools'
end

link '/usr/bin/phalcon' do
  to '/root/phalcon-devtools/phalcon.php'
  link_type :symbolic
end

bash 'name' do
  code 'chmod ugo+x /usr/bin/phalcon'
  action :run
end
