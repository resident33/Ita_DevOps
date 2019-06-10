#
# Cookbook:: lamp
# Recipe:: mysql
#
# Copyright:: 2019, The Authors, All Rights Reserved.
# Install MySQL client and server<strong>

  package 'mariadb-server' do
    action :install
  end

# Enable start on boot and start the MySQL server
service 'mysql.service' do
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
