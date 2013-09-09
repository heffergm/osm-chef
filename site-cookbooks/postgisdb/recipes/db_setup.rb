#
# Cookbook Name:: postgis
# Recipe:: db_setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

pg_user 'gisuser' do
  privileges :superuser => true, :createdb => true, :login => true
  encrypted_password '667ff118ef6d196c96313aeaee7da519'
end

pg_database 'gis' do
  owner 'gisuser'
  encoding 'utf8'
  template 'template0'
  #locale "en_US.UTF8"
end

# install extensions to database
pg_database_extensions 'gis' do
  languages 'plpgsql'
  #extensions ["hstore", "dblink"]  # install `hstore` and `dblink` extensions - multiple values in array
  postgis true
end
