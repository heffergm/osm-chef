#
# Cookbook Name:: postgis
# Recipe:: db_setup
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node.postgresql.version = '9.1'

pg_user 'gisuser' do
  privileges :superuser => true, :createdb => true, :login => true
  encrypted_password '667ff118ef6d196c96313aeaee7da519'
end

pg_database 'gis' do
  owner 'gisuser'
  encoding 'utf8'
  template 'template0'
end

pg_database_extensions 'gis' do
  languages 'plpgsql'
  #extensions ['hstore', 'dblink']
  postgis true
end
