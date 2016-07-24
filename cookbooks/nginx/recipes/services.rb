#
# Cookbook Name:: .
# Recipe:: services
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

service 'nginx' do
  action [ :enable, :start ]
end
