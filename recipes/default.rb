# enable the elep yum repo
yum_package 'epel-release'

if node['httpd']['enabled']
  include_recipe 'lamp::httpd'
  include_recipe 'lamp::php'
end

if node['mariadb']['enabled']
  include_recipe 'lamp::mariadb'
end

if node['postgres']['enabled']
  include_recipe 'lamp::postgres'
end

# install other helper tools
yum_package 'vim'
yum_package 'htop'
