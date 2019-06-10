#
# Cookbook:: lamp
# Recipe:: download
#
# Copyright:: 2019, The Authors, All Rights Reserved.
ruby_block "download_wordpress" do
  block do
    require 'fileutils'
    FileUtils.cd node['wordpress']['document_root']
    system 'curl -o latest.tar.gz https://wordpress.org/latest.tar.gz'
    system 'tar xzvf latest.tar.gz --strip-components=1 && rm latest.tar.gz'
    system 'chown -R apache:apache *'
  end
  not_if { ::File.exist?(File.join(node['wordpress']['document_root'], 'wp-settings.php')) }
  action :create
end
