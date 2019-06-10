# The name of your site
default['wordpress']['server_name'] ='itadevops'
# The root directory of your site, it will be /var/www/yoursitename.com
default['wordpress']['document_root'] = "/var/www/#{node['wordpress']['server_name']}"
# The default config file
default['wordpress']['default_conf'] = '/etc/httpd/conf/httpd.conf'
# e-mail for the server admin
default['wordpress']['server_admin'] ='itadevops@localhost.com'
# log dir for the site
default['wordpress']['log_dir'] = '/var/log/www'
# Error log for the site, it will be /var/log/wwwyoursitename-error.log
default['wordpress']['error_log'] = "#{node['wordpress']['log_dir']}/""#{node['wordpress']['server_name']}-error.log"
# Access log for the site, it will be /var/log/wwwyoursitename-access.log
default['wordpress']['custom_log'] = "#{node['wordpress']['log_dir']}/""#{node['wordpress']['server_name']}-access.log"
# The root password for MySQL
default['wordpress']['mysql_password'] = 'Password!23'
# The name of the WordPress database
default['wordpress']['wordpress_database'] = 'wordpress'
# The default username for the WordPress database
default['wordpress']['wordpress_username'] = 'wp_user'
# The default password for the WordPress database
default['wordpress']['wordpress_password'] = 'Password!23'
