# enable postgres repo
remote_file '/tmp/pgdg-redhat96-9.6-3.noarch.rpm' do
  source 'https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm'
  mode '0644'
end

yum_package 'pgdg-redhat96-9.6-3.noarch.rpm' do
  source '/tmp/pgdg-redhat96-9.6-3.noarch.rpm'
  action :install
end

yum_package 'postgresql96-server'
yum_package 'postgresql96-contrib'

execute '/usr/pgsql-9.6/bin/postgresql96-setup initdb'

service 'postgresql-9.6' do
  action [:enable, :start]
end
