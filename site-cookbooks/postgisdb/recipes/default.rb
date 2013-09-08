#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

%w(postgresql postgresql-contrib postgis).each do |p|
  package p do
    action :install
  end
end

execute 'create-gis-user' do
  exists = <<-EOH
  psql -c "select * from pg_user where usename='gisuser'" | grep -c gisuser 
  EOH
  command "createuser --superuser gisuser"
  not_if exists 
end
 
execute 'create-database' do
  user 'postgres'
  exists = <<-EOH
  psql -c "select * from pg_database WHERE datname='gis'" | grep -c gis
  EOH
  command "createdb -E UTF8 -O gisuser gis && createlang plpgsql gis"
  not_if exists
end

#bash 'config-gis-database' do
#  user 'postgres'
#  cwd '/tmp'
#  code <<-EOH
#    echo 'Beginning run...'
#    createuser --superuser gisuser
#    createdb -E UTF8 -O gisuser gis
#    createlang plpgsql gis
#    echo "ALTER USER gisuser WITH PASSWORD 'blah';" | psql -d gis
#
#    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
#    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
#    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql
#    psql -d gis -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;"
#    psql -d gis -c "GRANT ALL ON geometry_columns TO gisuser;"
#
#    echo 'Touching complete file'
#    touch #{setup_complete}
#  EOH
#  #not_if { ::File.exists?(setup_complete) }
#end

