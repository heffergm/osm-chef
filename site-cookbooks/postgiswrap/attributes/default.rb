default[:postgis][:version]                 = '2.0'
default[:postgresql][:ssl]                  = false
default[:postgresql][:version]              = '9.1'
default[:postgresql][:hba_file]             = "/etc/postgresql/#{node[:postgresql][:version]}/main/pg_hba.conf"
default[:postgresql][:ident_file]           = "/etc/postgresql/#{node[:postgresql][:version]}/main/pg_ident.conf"
default[:postgresql][:external_pid_file]    = "/var/run/postgresql/#{node[:postgresql][:version]}-main.pid"
default[:postgresql][:external_pid_file]    = "/var/run/postgresql/#{node[:postgresql][:version]}-main.pid"
default[:postgresql][:password][:postgres]  = '6b211d71ec225c69c66944eae0e524c4'

default[:postgresql][:pg_hba] =  [
  { :type => 'local', :db => 'all', :user => 'gisuser', :addr => '', :method => 'peer' },
  { :type => 'local', :db => 'all', :user => 'root', :addr => '', :method => 'ident' }
]

