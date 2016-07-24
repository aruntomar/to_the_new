#
# Cookbook Name:: .
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

Chef::Log.warn('running build-essential first')
# log 'run-build-essential' do
#   message "This is a message that will be added to the log."
#   level :warn
# end
#
include_recipe 'build-essential'
node.set['java']['jdk_version'] = '7'
include_recipe 'java'

execute 'update_apt' do
  command 'apt-get update; touch /tmp/apt_updated'
  action :run
  not_if { File.exist?('/tmp/apt_updated')}
end

# %w( nginx wget vim tmux curl ).each do |pkg|
#   package pkg do
#     action :install
#   end
# end
