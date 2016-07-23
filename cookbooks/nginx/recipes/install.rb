#
# Cookbook Name:: .
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'update_apt' do
  command 'apt-get update'
  action :run
end

%w( nginx vim curl ).each do |pkg|
  package pkg do
    action :install
  end
end
