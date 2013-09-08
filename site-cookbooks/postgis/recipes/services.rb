#
# Cookbook Name:: postgis
# Recipe:: services
#
# Copyright 2013
#
# All rights reserved - Do Not Redistribute
#

%w(postgresql).each do |s|
  service s do
    supports :status => true, :restart => true, :reload => true
    action [:enable, :start]
  end
end
