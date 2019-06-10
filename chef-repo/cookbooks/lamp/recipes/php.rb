#
# Cookbook:: lamp
# Recipe:: php
#
# Copyright:: 2019, The Authors, All Rights Reserved.


package 'yum-utils' do
  action :install
end

execute 'php_version' do
  command 'yum-config-manager --enable remi-php56.repo '
  ignore_failure true
end


%w{php php-fpm php-mysql php-xmlrpc php-gd php-pear php-pspell}.each do |pkg|
  package pkg do
    flush_cache before: true
    action :install
    notifies :reload, 'service[httpd]', :immediately
  end
end
