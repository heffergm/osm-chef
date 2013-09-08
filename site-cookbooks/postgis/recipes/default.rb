#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2013
#
# All rights reserved - Do Not Redistribute
#

# include apt on debian distros
case node[:platform_family]
when 'debian'
  include_recipe 'apt'
end

%w(postgis::packages postgis::dbsetup postgis::services).each do |r|
  include_recipe r
end

