#
# Cookbook Name:: osm2pgsql
# Recipe:: build
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

case node[:osm2pgsql][:install_type]
when 'source'
  bash 'build_osm2pgsql' do
    action :nothing
    cwd '/opt/osm2pgsql'
    code <<-EOH
      ./autogen.sh
      ./configure
      make && make install
    EOH
  end

when 'package'
  bash 'build_osm2pgsql' do
    action :nothing
    cwd '/opt/osm2pgsql'
    code <<-EOH
      touch debian/osm2pgsql.1
      dpkg-buildpackage
      dpkg -i ../osm2pgsql*.deb
    EOH
  end
end

git 'osm2pgsql' do
  repository 'https://github.com/openstreetmap/osm2pgsql.git'
  reference 'master'
  #reference node[:app_name][:git_revision]
  action :sync
  destination '/opt/osm2pgsql'
  notifies :run, "bash[build_osm2pgsql]"
  not_if 'test -d /opt/osm2pgsql'
end

