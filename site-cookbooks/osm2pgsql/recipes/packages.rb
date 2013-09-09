#
# Cookbook Name:: osm2pgsql
# Recipe:: packages
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

%w(build-essential libxml2-dev libgeos++-dev libpq-dev libbz2-dev libtool automake libprotobuf-c0-dev protobuf-c-compiler dh-make).each do |p|
  package p do
    action :install
  end
end

if node[:platform_version] <= '12.04'
  package 'proj' do
    action:install
  end
else
  package 'libproj-dev' do
    action :install
  end
end
