#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#include_recipe 'apt'

include_recipe 'postgresql'
include_recipe 'postgresql::postgis'
#include_recipe 'postgisdb::osm2pgsql'
include_recipe 'postgisdb::db_setup'

#pg_user "myuser" do
#  privileges :superuser => true, :createdb => true, :login => true
#  password "mypassword"
#end

