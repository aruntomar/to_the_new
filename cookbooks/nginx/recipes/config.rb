#
# Cookbook Name:: .
# Recipe:: config
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file '/var/www/html/index.html' do
  source 'to_the_new.html'
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

cookbook_file '/etc/nginx/sites-enabled/jetty.conf' do
  source 'jetty.conf'
  owner 'root'
  group 'root'
  mode 00644
  notifies :reload, 'service[nginx]', :delayed
end

link '/etc/nginx/sites-enabled/default' do
  # to '/etc/passwd'
  action :delete
  notifies :reload, 'service[nginx]', :delayed
end
