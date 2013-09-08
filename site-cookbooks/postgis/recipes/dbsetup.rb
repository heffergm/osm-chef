#
# Cookbook Name:: postgis
# Recipe:: dbsetup
#
# Copyright 2013
#
# All rights reserved - Do Not Redistribute
#

bash "postgis_setup" do
  user 'postgres'
  cwd '/tmp'
  code <<-EOH
    createuser gisuser
    createdb --encoding=UTF8 --owner=gisuser gis
    createlang plpsql gis
    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql
    psql -d gis -f /usr/share/postgresql/9.1/contrib/postgis_comments.sql
    psql -d gis -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;"
    psql -d gis -c "GRANT ALL ON geometry_columns TO gisuser;"
  EOH
end

