#
# Cookbook:: lamp
# Recipe:: mysqlcent
#
# Copyright:: 2019, The Authors, All Rights Reserved.
%w{mariadb mariadb-server}.each do |pkg|
  package pkg do
    action :install
  end
end

# Enable start on boot and start the MySQL server
service 'mariadb' do
  action [:enable, :start]
end

# Location of the initial MySQL script
template '/tmp/mysql.sql' do
  source "mysql.conf.erb"
end

# Execute the initial setup of MySQL
execute 'mysql_server' do
  command '/usr/bin/mysql -sfu root < /tmp/mysql.sql && ls /tmp/mysql.sql'
  ignore_failure true
end
