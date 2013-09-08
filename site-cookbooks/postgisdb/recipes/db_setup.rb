#
# Cookbook Name:: postgis
# Recipe:: db_setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(postgresql postgresql-contrib postgis).each do |p|
  package p do
    action :install
  end
end

include_recipe 'database::postgresql'

postgresql_connection_info = {:host => 'localhost',
                              :port => node['postgresql']['config']['port'],
                              :username => 'postgres',
                              :password => node['postgresql']['password']['postgres']}

postgresql_database 'gis' do
  connection postgresql_connection_info
  encoding 'UTF8'
  action :create
end

postgresql_database_user 'gisuser' do
  connection postgresql_connection_info
  action :create
end


#execute 'createuser-gisuser' do
#  user 'postgres'
#  command 'createuser --superuser gisuser'
#  not_if "psql postgres -tAc \"SELECT 1 FROM pg_roles WHERE rolname='gisuser'\""
#end

#execute 'createdb-gis' do
#  user 'postgres'
#  command 'createdb -E utf8 -O gisuser gis'
#  not_if 'psql -l | grep -c gis'
#end

#execute 'postgis-contrib' do
#  user 'postgres'
#  command 'psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql'
#end

#execute 'postgis-spatial' do
#  user 'postgres'
#  command 'psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql'
#end

#execute 'postgis-comments' do
#  user 'postgres'
#  command 'psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql'
#end

#execute 'postgis-grant-select' do
#  user 'postgres'
#  command 'psql -d gis -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;"'
#end

#execute 'postgis-grant-all' do
#  user 'postgres'
#  command 'psql -d gis -c "GRANT ALL ON geometry_columns TO gisuser;"'
#end

