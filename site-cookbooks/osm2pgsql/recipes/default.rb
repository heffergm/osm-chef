#
# Cookbook Name:: osm2pgsql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'software-properties-common' do
  action :install
end

bash 'add-osm-repo' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    add-apt-repository -y ppa:kakrueger/openstreetmap
  EOH
end

package 'osm2pgsql' do
  action :install
end

