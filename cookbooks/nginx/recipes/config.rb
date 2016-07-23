#
# Cookbook Name:: .
# Recipe:: config
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

cookbook_file "#{node['nginx']['document_root']}/index.html" do
  source 'to_the_new.html'
  owner 'root'
  group 'root'
  mode 00755
  action :create
end

template "#{node['nginx']['sites-enabled']}/jetty.conf" do
  source 'jetty.conf.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :reload, 'service[nginx]', :delayed
end

link "#{node['nginx']['sites-enabled']}/default" do
  action :delete
  notifies :reload, 'service[nginx]', :delayed
end