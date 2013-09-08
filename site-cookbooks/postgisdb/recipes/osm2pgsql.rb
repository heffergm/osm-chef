#
# Cookbook Name:: postgis
# Recipe:: osm2pgsql
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


if node[:lsb][:release] <= '12.04'
  pkg = 'python-software-properties'
else
  pkg = 'software-properties-common'
end
package pkg do
  action :install
end

bash 'add-osm-repo' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    add-apt-repository -y ppa:kakrueger/openstreetmap
  EOH
  not_if 'ls /etc/apt/sources.list.d/kakrueger-openstreetmap-precise.list'
end

package 'osm2pgsql' do
  action :install
end

