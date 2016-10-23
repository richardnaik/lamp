# enable the percona repo
yum_package 'percona-repo' do
  source 'http://www.percona.com/downloads/percona-release/redhat/0.1-3/percona-release-0.1-3.noarch.rpm'
  provider Chef::Provider::Package::Rpm
  action :install
end

# install percona and xtrabackup
yum_package 'Percona-Server-server-57'
yum_package 'percona-xtrabackup'

# install percona toolkit
yum_package 'percona-toolkit'

# start and enable the service
service 'mysql' do
  action [:enable, :start]
end
