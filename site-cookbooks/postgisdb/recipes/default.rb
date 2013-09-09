#
# Cookbook Name:: postgis
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'postgresql::postgis'
include_recipe 'postgisdb::db_setup'

