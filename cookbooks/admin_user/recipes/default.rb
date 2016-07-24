#
# Cookbook Name:: admin_user
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


chef_gem 'chef-handler-mail'
require 'chef/handler/mail'

chef_handler 'MailHandler' do
   source 'chef/handler/mail'
   arguments :to_address => "root"
   action :nothing
end.run_action(:enable)

package 'postfix'

uid = data_bag_item(:users, 'arun', 'training@123')

user uid['id'] do
  comment 'admin user'
  gid 'users'
  shell '/bin/bash'
end

directory '/home/krishna/.ssh/' do
  owner 'krishna'
  group 'users'
  mode 00755
  recursive true
  action :create
end

cookbook_file '/home/krishna/.ssh/authorized_keys' do
  source 'authorized_keys'
  owner 'krishna'
  group 'users'
  mode 00400
end

file '/tmp/env' do
  owner 'root'
  group 'root'
  mode 00755
  action :create
  content node.environment
end
#
# if node.environment == 'production'
#   # do this
# else
#   # do that
# end
