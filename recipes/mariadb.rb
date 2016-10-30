# enable the mariadb repo
template '/etc/yum.repos.d/mariadb.repo' do
  source 'mariadb.repo.erb'
  mode '0755'
  action :create
end

# install mariadb
yum_package 'MariaDB-server'
yum_package 'MariaDB-client'

# start and enable the service
service 'mysql' do
  action [:enable, :start]
end
