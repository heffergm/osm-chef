#
# Cookbook Name:: postgiswrap
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'postgresql::default'
include_recipe 'postgresql::server'
include_recipe 'postgresql::postgis'
include_recipe 'postgiswrap::db_setup'

