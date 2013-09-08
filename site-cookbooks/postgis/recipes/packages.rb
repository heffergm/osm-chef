#
# Cookbook Name:: postgis
# Recipe:: packages
#
# Copyright 2013
#
# All rights reserved - Do Not Redistribute
#

%w(postgresql postgresql-contrib postgis).each do |p|
  package p do
    action :install
  end
end
