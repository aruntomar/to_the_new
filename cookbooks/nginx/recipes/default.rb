#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'nginx::install'
include_recipe 'nginx::config'
include_recipe 'nginx::services'
